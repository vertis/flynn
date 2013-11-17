module Flynn
  module Recipes
    class Gem
      def create(app_name, *options)
        puts "Creating new project in: #{app_name}"
        run("bundle gem #{app_name}")
      end
    end
  end
end