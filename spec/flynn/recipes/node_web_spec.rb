require 'spec_helper'

describe Flynn::Recipes::NodeWeb do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a node web project" do
    before(:all) do
      Dir.chdir('tmp')
      subject.create('my_node')
    end

    after(:all) do
      FileUtils.rm_r('my_node')
      Dir.chdir('..')
    end

    it "should create a new node project with the correct name" do
      File.exists?('my_node').should be_true
    end

    it "should create an package.json for the new application" do
      File.exists?('my_node/package.json').should be_true
    end

    it "should create an app.js file for the new application" do
      File.exists?('my_node/app.js').should be_true
    end

    it "should have the standard directories" do
      File.directory?('my_node/public').should be_true
      File.directory?('my_node/views').should be_true
    end
  end
end