require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Basic do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  it "should create a new basic project with the correct name" do
    Dir.chdir(Dir.tmpdir)
    subject.create('my_directory')
    File.exists?('my_directory').should be_true
    FileUtils.rm_r('my_directory')
    Dir.chdir('..')
  end
end