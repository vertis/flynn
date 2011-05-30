require 'fileutils'

module Flynn
  module Recipes
    class RailsEdge < RvmBase
      def create(app_name, options=[])
        #disable_rvmrc
        rails_base = "#{ENV['HOME']}/.flynn/rails_edge"
        RVM.gemset_create app_name
        RVM.gemset_use! app_name

        FileUtils.mkdir_p rails_base
        File.open("#{ENV['HOME']}/.flynn/rails_edge/Gemfile", 'w') {|f| f.puts gemfile }

        bundle_cmd = "bundle install --gemfile #{rails_base}/Gemfile --binstubs"
        puts "Creating '#{app_name}' running edge rails (this could take a while)"
        system("rvm gemset use #{app_name} && #{bundle_cmd}")
        system("rvm gemset use #{app_name} && #{rails_base}/bin/rails new #{app_name} --dev #{options.join(" ")}")
        create_project_rvmrc(app_name)
        #restore_rvmrc
      end

      private
        def gemfile
          @gemfile ||= <<-EOS
# A sinatra gemfile
source "http://rubygems.org"

gem 'rake', '>= 0.9.0'
gem 'rails', :git => 'git://github.com/rails/rails.git'
          EOS
        end
    end
  end
end