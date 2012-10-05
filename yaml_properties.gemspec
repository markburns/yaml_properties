# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml_properties/version'

Gem::Specification.new do |gem|
  gem.name          = "yaml_properties"
  gem.version       = YamlProperties::VERSION
  gem.authors       = ["Mark Burns"]
  gem.email         = ["markthedeveloper@gmail.com"]
  gem.description   = %q{Easily add configurable variables for app config using YAML files}

  gem.summary       = <<-DESCRIPTION.gsub(/^\s{4}/, '')
    Example:

      YamlProperties.life_the_universe_and_everything
      #=> 42

    In config/properties.yml

      life_the_universe_and_everything: 42
  DESCRIPTION

  gem.homepage      = ""

  gem.add_dependency  'active_support', '>= 1.0'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'debugger'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
