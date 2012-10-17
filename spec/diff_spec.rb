require File.expand_path('../../lib/yaml_properties/diff.rb', __FILE__)

describe YamlProperties::Diff do
  def f file
    File.expand_path("../fixtures/#{file}.yml", __FILE__)
  end

  it "raises an exception if two YAML files have different keys" do
    -> {YamlProperties::Diff.new f('file1'), f('file2')}.should raise_error
  end

  it "doesn't raise an exception if two YAML files have same keys" do
    -> {YamlProperties::Diff.new f('file1'), f('file4') }.should_not raise_error
  end

  it "raises a argument error if two YAML files have present vs. non-present keys" do
    argument_error = "Following keys are not present in both files '[\"d\"]'"

    -> {YamlProperties::Diff.new f('file2'),f('file3')}.should(
      raise_error(ArgumentError, argument_error))
  end
end

