require 'spec_helper'
require 'fileutils'

describe Flynn::Recipes::RailsEdge do
  it_should_behave_like('a recipe')

  it "should put down a gemfile to use with bundling" do
    File.exists?("#{ENV['HOME']}/.flynn/rails_edge/gemfile").should be_true
  end
end