require 'fileutils'

module Flynn
  module Recipes
    class Refinerycms < RvmBase
      def create(app_name, options=[])
        RVM.gemset_create app_name
        RVM.gemset_use! app_name

        run("gem install refinerycms --no-rdoc --no-ri")
        puts "Creating #{app_name}"
        run("rvm gemset use #{app_name} && refinerycms #{app_name} #{options.join(" ")}")
        create_project_rvmrc(app_name)
      end
    end
  end
end