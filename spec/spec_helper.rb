$:.push File.expand_path("../lib", __FILE__)
require 'cover_me'
require "flynn"
require 'tmpdir'

RSpec.configure do |config|
  # config.after(:suite) do
  #   CoverMe.complete!
  # end
end

shared_examples_for "a recipe" do
  it "should have a create method" do
    subject.should respond_to(:create)
  end

  context "creating a #{subject.class.to_s.split('::').last.underscore} project" do
    before(:all) do
      @app_name = "my_#{subject.class.to_s.split('::').last.underscore}"
      @cwd = Dir.pwd
      Dir.chdir(Dir.tmpdir)
      subject.create(@app_name)
    end

    after(:all) do
      FileUtils.rm_r(@app_name)
      Dir.chdir(@cwd)
    end

    it "should create a new gem project with the correct name" do
      File.exists?(@app_name).should be_true
    end

    it "should create an .rvmrc for the new application" do
      File.exists?("#{@app_name}/.rvmrc").should be_true
    end
  end
end

