require 'spec_helper'
require 'pathname'

describe Flynn::Config do
  context "#build" do
    before :all do
      @flynn_directory = Pathname.new("#{ENV["HOME"]}/.flynn")
      @recipes_directory = @flynn_directory + 'recipes'
      @config_file = @flynn_directory + 'config.yml'
    end

    it "should create the .flynn directory if it doesn't exist" do
      Flynn::Config.new.build
      @flynn_directory.exist?.should == true
    end

    it "should create the .flynn/recipes directory if it doesn't exist" do
      Flynn::Config.new.build
      @recipes_directory.exist?.should == true
    end

    it "should create the .flynn/config.yml file if it doesn't exist" do
      Flynn::Config.new.build
      @config_file.exist?.should == true
    end
  end
end