require 'active_support/core_ext/hash'

class YamlProperties::Diff
  def initialize a, b
    @hash_a, @hash_b = read(a, b)
    unless same?
      raise ArgumentError.new(error_message)
    end
  end

  private

  def error_message
    "Following keys are not present in both files '#{key_diff}'"
  end

  def key_diff
    (keys_a - keys_b) + (keys_b - keys_a)
  end

  def keys_a
    @hash_a.keys
  end

  def keys_b
    @hash_b.keys
  end

  def same?
    key_diff.empty?
  end

  def read *files
    files.map do |f|
      YAML.load File.read(f)
    end
  end

end

