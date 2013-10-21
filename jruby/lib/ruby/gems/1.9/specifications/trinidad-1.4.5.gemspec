# -*- encoding: utf-8 -*-
# stub: trinidad 1.4.5 ruby lib

Gem::Specification.new do |s|
  s.name = "trinidad"
  s.version = "1.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Calavera"]
  s.date = "2013-06-14"
  s.description = "Trinidad allows you to run Rails or Rack applications within an embedded Apache Tomcat container. Serves your requests with the elegance of a cat !"
  s.email = "calavera@apache.org"
  s.executables = ["trinidad"]
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["bin/trinidad", "README.md", "LICENSE"]
  s.homepage = "http://github.com/trinidad/trinidad"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.5"
  s.summary = "Web server for Rails/Rack applications built upon JRuby::Rack and Apache Tomcat"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trinidad_jars>, [">= 1.2.3"])
      s.add_runtime_dependency(%q<jruby-rack>, [">= 1.1.13"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.12.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.12.1"])
      s.add_development_dependency(%q<fakefs>, [">= 0.4.0"])
    else
      s.add_dependency(%q<trinidad_jars>, [">= 1.2.3"])
      s.add_dependency(%q<jruby-rack>, [">= 1.1.13"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.12.0"])
      s.add_dependency(%q<mocha>, ["~> 0.12.1"])
      s.add_dependency(%q<fakefs>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<trinidad_jars>, [">= 1.2.3"])
    s.add_dependency(%q<jruby-rack>, [">= 1.1.13"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.12.0"])
    s.add_dependency(%q<mocha>, ["~> 0.12.1"])
    s.add_dependency(%q<fakefs>, [">= 0.4.0"])
  end
end
