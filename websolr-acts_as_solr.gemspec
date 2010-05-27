# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{websolr-acts_as_solr}
  s.version = "1.3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kyle Maxwell", "Nick Zadrozny"]
  s.date = %q{2010-05-26}
  s.description = %q{Shim from websolr to acts_as_solr}
  s.email = %q{kyle@kylemaxwell.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/websolr-acts_as_solr.rb",
     "test/helper.rb",
     "test/test_websolr-acts_as_solr.rb",
     "websolr-acts_as_solr.gemspec"
  ]
  s.homepage = %q{http://github.com/fizx/websolr-acts_as_solr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Shim from websolr to acts_as_solr}
  s.test_files = [
    "test/helper.rb",
     "test/test_websolr-acts_as_solr.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<acts_as_solr>, ["= 1.3.2"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<acts_as_solr>, ["= 1.3.2"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<acts_as_solr>, ["= 1.3.2"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

