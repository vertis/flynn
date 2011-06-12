require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Refinerycms do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a refinerycms project" do
    before(:all) do
      Dir.chdir('tmp')
      subject.create('my_refinerycms')
    end

    after(:all) do
      FileUtils.rm_r('my_refinerycms')
      Dir.chdir('..')
    end

    it "should create a new refinerycms project with the correct name" do
      File.exists?('my_refinerycms').should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?('my_refinerycms/.rvmrc').should be_true
    end
  end
end