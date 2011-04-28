module Flynn
  module Recipes
    class Rails2 < AbstractRecipe
      def create(app_name, *options)
        RVM.gemset_create 'flynn_rails2'
        RVM.gemset_use! 'flynn_rails2'
        #install_gem 'install', 'rails', '-v', '~> 2.3'
        system("gem install rails -v 2.3.11 --no-rdoc --no-ri")
        puts "Creating #{app_name}"
        system("rvm gemset use flynn_rails2 && rails #{app_name}")
      end
    end
  end
end