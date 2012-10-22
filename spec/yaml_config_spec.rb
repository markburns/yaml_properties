require File.expand_path('spec/spec_helper')
require './lib/yaml_properties'

describe YamlProperties do
  context "in general" do
    before do
      File.stub(:open)

      YAML.stub(:load).and_return properties
    end

    let(:properties) do
      {
        "life_the_universe_and_everything" => 42,
        "some_string_value"                => "something",
        "a boolean"                        => true,
        "parent"                           => {
         "child"=>"Egg"}
      }
    end

    specify "overriding attributes (in e.g. tests)" do
      YamlProperties.override_attribute :life_the_universe_and_everything, 13
      YamlProperties.life_the_universe_and_everything.should == 13
      YamlProperties.reset!
      YamlProperties.life_the_universe_and_everything.should == 42
    end

    specify do
      YamlProperties.properties.should == properties
    end
    specify do
      YamlProperties.life_the_universe_and_everything.should == 42
    end

    specify do
      YamlProperties.some_string_value.should == "something"
    end

    specify do
      YamlProperties.send("a boolean").should == true
    end

    specify do
      YamlProperties.parent.should == {"child" => "Egg"}
    end

    context "extending a module" do
      module Acme
        extend YamlProperties
      end

      specify do
        Acme.life_the_universe_and_everything.should == 42
      end
    end
  end

  context "overriding yaml_file default" do
    module Mystery
      extend YamlProperties

      def self.yaml_file
        "./spec/fixtures/test.yml"
      end
    end

    specify do
      Mystery.life_the_universe_and_everything.should == "Nobody knows"
    end
  end
end
