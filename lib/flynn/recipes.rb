require 'flynn/recipes/rvm_base'
require 'flynn/recipes/gem'
require 'flynn/recipes/basic'
require 'flynn/recipes/rails2'
require 'flynn/recipes/rails3'

module Flynn
  module Recipes
    def self.load_user_recipes
      Flynn.config.recipes_directory.children.each do |child|
        require child.expand_path if child.extname=='.rb'
      end
    end
  end
end