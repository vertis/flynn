require 'flynn/recipes/rvm_base'
require 'flynn/recipes/basic'
require 'flynn/recipes/gem'
require 'flynn/recipes/node_web'
require 'flynn/recipes/rails2'
require 'flynn/recipes/rails3'
require 'flynn/recipes/rails_edge'
require 'flynn/recipes/refinerycms'
require 'flynn/recipes/sinatra'

module Flynn
  module Recipes
    def self.load_user_recipes
      Flynn.config.recipes_directory.children.each do |child|
        require child.expand_path if child.extname=='.rb'
      end
    end

    def self.available_recipes
      Flynn::Recipes.constants - [:RvmBase]
    end
  end
end