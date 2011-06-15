require 'fileutils'

module Flynn
  module Recipes
    class Refinerycms < RvmBase
      def create(app_name, options=[])
        RVM.gemset_create app_name
        RVM.gemset_use! app_name

        run("rvm #{ENV['RUBY_VERSION']}@#{app_name} exec gem install refinerycms --no-rdoc --no-ri")
        puts "Creating #{app_name}"
        run("rvm #{ENV['RUBY_VERSION']}@#{app_name} exec refinerycms #{app_name} #{options.join(" ")}")
        create_project_rvmrc(app_name)
      end
    end
  end
end