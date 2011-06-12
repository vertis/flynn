require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Rails3 do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a rails3 project" do
    before(:all) do
      Dir.chdir(Dir.tmpdir)
      subject.create('my_rails3')
    end

    after(:all) do
      FileUtils.rm_r('my_rails3')
      Dir.chdir('..')
    end

    it "should create a new rails3 project with the correct name" do
      File.exists?('my_rails3').should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?('my_rails3/.rvmrc').should be_true
    end
  end
end