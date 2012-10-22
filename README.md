# YamlProperties

If you find yourself often setting app config in yaml files for different
environments etc. Then this can be quite useful to simply access those variables.

## Examples
```ruby
YamlProperties.redis_port
```

Will by default read a value from a YAML file in `config/properties.yml`

```yaml
redis_port: 1369
```

Also can be added to a module or class like

```ruby
module Shutl
  extend YamlProperties
end

```

##Override filename like this

```ruby
module Shutl
  extend YamlProperties
  def self.yaml_file
    ENV['SINATRA_ENV'] == 'development' ? 'config/properties.yml' : 'config/properties_production.yml'
  end
end
```

##Temporarily override values in e.g. cucumber
```ruby

#lib/shutl.rb
module Shutl
  extend YamlProperties
end

#features/support/env.rb
After do |scenario|
  Shutl.reset!
end

#features/step_definitions/egg_steps.rb
Given /\AThere are \d+ eggs in a dozen\z/ |dozen|
  Shutl.override_attribute :egg, dozen
end
```

#Yadayada

```ruby
gem 'yaml_config'
```

Usual gem/bundler usage/contribution guidelines
