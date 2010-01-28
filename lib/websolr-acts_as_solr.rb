# Post-require hooks for acts_as_solr and sunspot if this 
# gem is loaded and WEBSOLR_URL is defined.

gem "acts_as_solr", :version => "1.1.1"
require "acts_as_solr"
require "rake"
load "tasks/solr.rake"
load "tasks/database.rake"

if ENV["WEBSOLR_URL"]
  CLIENT_KEY = "sunspot-0.10"
  require "rest_client"
  
  api_key = ENV["WEBSOLR_URL"][/[0-9a-f]{11}/] or raise "Invalid WEBSOLR_URL: bad or no api key"
  print "Setting schema to #{CLIENT_KEY}..."
  STDOUT.flush
  RestClient.post("http://www.websolr.com/schema/#{api_key}", :client => CLIENT_KEY)
  puts "done"
  
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