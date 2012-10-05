# YamlConfig

If you find yourself often setting app config in yaml files for different
environments etc. Then this can be quite useful to simply access those variables.


```ruby
YamlConfig.redis_port
```

Will by default read a value from a YAML file in `config/properties.yml`

```yaml
redis_port: 1369
```

Also can be added to a module or class like

```ruby
module Shutl
  extend YamlConfig
end

```

#Override filename like this

```ruby
module Shutl
  extend YamlConfig
  def self.yaml_file
    ENV['SINATRA_ENV'] == 'development' ? 'config/properties.yml' : 'config/properties_production.yml'
  end
end
```
#Yadayada
gem 'yaml_config'

Usual gem/bundler usage/contribution guidelines
