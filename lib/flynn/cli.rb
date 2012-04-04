require 'active_support/inflector'

module Flynn
  class Cli
    def self.print_usage
      puts "Usage: flynn <recipe> <app_name> [options]"
      available_recipes = Flynn::Recipes.available_recipes.map {|recipe| recipe.to_s.underscore }
      puts ""
      puts "Available recipes:"
      available_recipes.each do |recipe|
        puts "  #{recipe}"
      end
    end

    def self.run(options)
      # TODO: Move somewhere else
      Flynn::Recipes.load_user_recipes
      recipe = options.shift
      if recipe == 'help'
        print_usage
        exit 0
      end
      app_name = options.shift
      if Flynn::Recipes.const_defined?(recipe.camelize)
        Flynn::Recipes.const_get(recipe.camelize).new.create(app_name, options)
      else
        $stderr.puts "Flynn doesn't know how to create: #{recipe}"
        puts ""
        print_usage
      end
    end
  end
end