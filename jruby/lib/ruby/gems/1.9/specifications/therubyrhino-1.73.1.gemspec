# -*- encoding: utf-8 -*-
# stub: therubyrhino 1.73.1 ruby lib

Gem::Specification.new do |s|
  s.name = "therubyrhino"
  s.version = "1.73.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.date = "2012-01-24"
  s.description = "Call javascript code and manipulate javascript objects from ruby. Call ruby code and manipulate ruby objects from javascript."
  s.email = "cowboyd@thefrontside.net"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/cowboyd/therubyrhino"
  s.require_paths = ["lib"]
  s.rubyforge_project = "therubyrhino"
  s.rubygems_version = "2.1.5"
  s.summary = "Embed the Rhino JavaScript interpreter into JRuby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<jruby-openssl>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<jruby-openssl>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<jruby-openssl>, [">= 0"])
  end
end