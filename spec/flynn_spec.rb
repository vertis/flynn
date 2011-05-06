require 'spec_helper'

describe Flynn do
  [:Basic, :Gem, :Rails2, :Rails3].each do |recipe|
    it "should instantiate the #{recipe} recipe with no arguments" do
      lambda { Flynn::Recipes.const_get(recipe).new }.should_not raise_error
      lambda { Flynn::Recipes.const_get(recipe).new( "hiss" ) }.should raise_error
    end
  end
end