require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Gem do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a gem project" do
    before(:all) do
      Dir.chdir('tmp')
      subject.create('my_gem')
    end

    after(:all) do
      FileUtils.rm_r('my_gem')
      Dir.chdir('..')
    end

    it "should create a new gem project with the correct name" do
      File.exists?('my_gem').should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?('my_gem/.rvmrc').should be_true
    end
  end
end