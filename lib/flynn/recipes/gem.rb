module Flynn
  module Recipes
    class Gem < AbstractRecipe
      def create(app_name, *options)
        puts "Creating new project in: #{app_name}"
        system("bundle gem #{app_name}")

        rvmrc = <<-RVMRC
        rvm_gemset_create_on_use_flag=1
        rvm #{@ruby_version}@#{app_name}
        RVMRC
        File.open("#{app_name}/.rvmrc", 'w') {|f| f.write(rvmrc) }
        system("cd #{app_name} && rvm rvmrc trust")
      end
    end
  end
end