# -*- encoding: utf-8 -*-
# stub: warbler 1.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "warbler"
  s.version = "1.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Sieger"]
  s.date = "2011-08-15"
  s.description = "Warbler is a gem to make a Java jar or war file out of any Ruby,\nRails, Merb, or Rack application. Warbler provides a minimal,\nflexible, Ruby-like way to bundle up all of your application files for\ndeployment to a Java environment."
  s.email = "nick@nicksieger.com"
  s.executables = ["warble"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt"]
  s.files = ["bin/warble", "History.txt", "LICENSE.txt", "Manifest.txt", "README.txt"]
  s.homepage = "http://caldersphere.rubyforge.org/warbler"
  s.rdoc_options = ["--main", "README.txt", "-SHN", "-f", "darkfish"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "caldersphere"
  s.rubygems_version = "2.1.5"
  s.summary = "Warbler chirpily constructs .war files of your Rails applications."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.8.7"])
      s.add_runtime_dependency(%q<jruby-jars>, [">= 1.4.0"])
      s.add_runtime_dependency(%q<jruby-rack>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, ["~> 2.12"])
    else
      s.add_dependency(%q<rake>, [">= 0.8.7"])
      s.add_dependency(%q<jruby-jars>, [">= 1.4.0"])
      s.add_dependency(%q<jruby-rack>, [">= 1.0.0"])
      s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, ["~> 2.12"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.8.7"])
    s.add_dependency(%q<jruby-jars>, [">= 1.4.0"])
    s.add_dependency(%q<jruby-rack>, [">= 1.0.0"])
    s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, ["~> 2.12"])
  end
end