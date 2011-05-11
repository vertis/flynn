require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::Basic do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  it "should create a directory" do
    Dir.chdir('tmp')
    subject.create('my_directory')
    File.exists?('my_directory').should be_true
    FileUtils.rm_r('my_directory')
    Dir.chdir('..')
  end
end