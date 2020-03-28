# -*- encoding: utf-8 -*-
# stub: executables 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "executables".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rohit Patel".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-04-16"
  s.description = "Run your rails app's executables via a web interface\n".freeze
  s.email = ["rohit.patel061@gmail.com".freeze]
  s.homepage = "https://github.com/rohitcy/executables".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Executables gives you an ability to run your rails app's executables via a web interface.  With the help of simple configuration options you can tell executables to expose your executables. Executables will fetch all the executables as per the configuration options, along with their respective executable methods and arguments they accept thus giving you an ability to execute them.  Read more here to know more about the intentions behind building executables".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
  end
end
