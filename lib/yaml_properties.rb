require "yaml_properties/version"
require "active_support/core_ext/hash"

module YamlProperties
  def properties
    @properties ||= load_properties.with_indifferent_access
  end

  def reset_properties
    @properties = nil
  end

  def method_missing(key, *args, &block)
    return properties[key] if properties.keys.include? key.to_s

    super key, *args, &block
  end

  private

  def yaml_file
    File.join %w(config properties.yml)
  end

  def load_properties
    YAML.load File.open(yaml_file)
  end

  extend self
end
