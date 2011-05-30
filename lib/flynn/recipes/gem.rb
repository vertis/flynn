module Flynn
  module Recipes
    class Gem < RvmBase
      def create(app_name, *options)
        puts "Creating new project in: #{app_name}"
        run("bundle gem #{app_name}")

        create_project_rvmrc(app_name)
      end
    end
  end
end