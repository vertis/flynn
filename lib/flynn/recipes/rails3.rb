require 'fileutils'

module Flynn
  module Recipes
    class Rails3 < AbstractRecipe
      def create(app_name, *options)
        RVM.gemset_create app_name
        RVM.gemset_use! app_name
        #install_gem 'install', 'rails', '-v', '~> 2.3'
        system("gem install rails -v '~> 3.0' --no-rdoc --no-ri")
        puts "Creating #{app_name}"
        system("rvm gemset use #{app_name} && rails new #{app_name}")
        create_project_rvmrc(app_name)
      end
    end
  end
end