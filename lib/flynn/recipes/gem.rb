module Flynn
  module Recipes
    class Gem < RvmBase
      def create(app_name, *options)
        puts "Creating new project in: #{app_name}"
        system("bundle gem #{app_name}")

        create_project_rvmrc(app_name)
        system("cd #{app_name} && rvm rvmrc trust")
      end
    end
  end
end