# Post-require hooks for acts_as_solr and sunspot if this 
# gem is loaded and WEBSOLR_URL is defined.

gem "acts_as_solr", :version => "1.1.3"
require "acts_as_solr"

if ENV["WEBSOLR_URL"]
  api_key = ENV["WEBSOLR_URL"][/[0-9a-f]{11}/] or raise "Invalid WEBSOLR_URL: bad or no api key"
  
  ENV["WEBSOLR_CONFIG_HOST"] ||= "www.websolr.com"
  
  @pending = true
  Rails.logger.info "Checking index availability..."

  response = RestClient.post("http://#{ENV["WEBSOLR_CONFIG_HOST"]}/schema/#{api_key}.json", :client => "acts_as_solr")
  json = JSON.parse(response)
  case json["status"]
  when "ok": 
    Rails.logger.info "Index is available!"
    @pending = false
  when "pending": 
    Rails.logger.info "Provisioning index, things may not be working for a few seconds ..."
    sleep 5
  when "error"
    Rails.logger.error json["message"]
    @pending = false
  else
    Rails.logger.error "wtf: #{json.inspect}" 
  end
  
  module ActsAsSolr
    class Post        
      def self.execute(request)
        begin
          connection = Solr::Connection.new(ENV["WEBSOLR_URL"])
          return connection.send(request)
        rescue 
          raise ActsAsSolr::ConnectionError, 
                "Couldn't connect to the Solr server at #{ENV["WEBSOLR_URL"]}. #{$!}"
          false
        end
      end
    end
  end
end