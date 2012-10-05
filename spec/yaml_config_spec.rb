require File.expand_path('spec/spec_helper')
require './lib/yaml_config'

describe YamlConfig do
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

    specify do
      YamlConfig.properties.should == properties
    end
    specify do
      YamlConfig.life_the_universe_and_everything.should == 42
    end

    specify do
      YamlConfig.some_string_value.should == "something"
    end

    specify do
      YamlConfig.send("a boolean").should == true
    end

    specify do
      YamlConfig.parent.should == {"child" => "Egg"}
    end

    context "extending a module" do
      module Acme
        extend YamlConfig
      end

      specify do
        Acme.life_the_universe_and_everything.should == 42
      end
    end
  end

  context "overriding yaml_file default" do
    module Mystery
      extend YamlConfig

      def self.yaml_file
        "./spec/test.yml"
      end
    end

    specify do
      Mystery.life_the_universe_and_everything.should == "Nobody knows"
    end
  end
end
