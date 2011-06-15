require 'spec_helper'

describe Flynn::Recipes do
  before :all do
    recipe = """
    class Flynn::Recipes::Test
      def create
      end
    end
    """
    @test_recipe = Flynn.config.recipes_directory + 'test.rb'
    File.open(@test_recipe, 'w') {|f| f.puts recipe}
  end

  after :all do
    FileUtils.rm_r(@test_recipe)
  end

  it "should load all the recipes in the user recipe paths" do
    Flynn::Recipes.load_user_recipes
    lambda { Flynn::Recipes::Test.new }.should_not raise_error
  end

  it "should return a list of all defined recipes" do
    # TODO: This is a bit of a clunky spec
    Flynn::Recipes.available_recipes.should == [:Basic, :Gem, :NodeWeb, :Rails2, :Rails3, :RailsEdge, :Refinerycms, :Sinatra, :Test]
  end
end