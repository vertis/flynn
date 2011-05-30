require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Sinatra do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a sinatra project" do
    before(:all) do
      Dir.chdir('tmp')
      subject.create('my_sinatra')
    end

    after(:all) do
      FileUtils.rm_r('my_sinatra')
      Dir.chdir('..')
    end

    it "should create a new sinatra project with the correct name" do
      File.exists?('my_sinatra').should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?('my_sinatra/.rvmrc').should be_true
    end

    it "should create an Gemfile for the new application" do
      File.exists?('my_sinatra/Gemfile').should be_true
    end

    it "should create a config.ru for the new application" do
      File.exists?('my_sinatra/config.ru').should be_true
    end

    it "should create an app.rb file for the new application" do
      File.exists?('my_sinatra/app.rb').should be_true
    end

    it "should have the standard directories" do
      File.directory?('my_sinatra/public').should be_true
      File.directory?('my_sinatra/views').should be_true
    end
  end
end