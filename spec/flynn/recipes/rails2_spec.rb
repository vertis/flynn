require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Rails2 do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a rails2 project" do
    before(:all) do
      Dir.chdir('tmp')
      subject.create('my_rails2')
    end

    after(:all) do
      FileUtils.rm_r('my_rails2')
      Dir.chdir('..')
    end

    it "should create a new rails2 project with the correct name" do
      File.exists?('my_rails2').should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?('my_rails2/.rvmrc').should be_true
    end
  end
end