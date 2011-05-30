require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::RailsEdge do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a rails edge project" do
    before(:all) do
      Dir.chdir('tmp')
      subject.create('my_edge')
    end

    after(:all) do
      FileUtils.rm_r('my_edge')
      Dir.chdir('..')
    end

    it "should put down a gemfile to use with bundling" do
      File.exists?("#{ENV['HOME']}/.flynn/rails_edge/gemfile").should be_true
    end

    it "should create a new rails edge project with the correct name" do
      File.exists?('my_edge').should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?('my_edge/.rvmrc').should be_true
    end
  end
end