require 'fileutils'

module Flynn
  module Recipes
    class RailsEdge < RvmBase
      def create(app_name, options=[])
        #disable_rvmrc
        rails_base = "#{ENV['HOME']}/.flynn/rails_edge"
        rails_src = "#{ENV['HOME']}/.flynn/rails_src"
        RVM.gemset_create app_name
        RVM.gemset_use! app_name

        FileUtils.mkdir_p rails_base
        File.open("#{ENV['HOME']}/.flynn/rails_edge/Gemfile", 'w') {|f| f.puts gemfile }
        if File.directory?(rails_src)
          inside rails_src do
            run("git pull")
          end
        else
          run("git clone git://github.com/rails/rails.git #{rails_src}")
        end
        bundle_cmd = "bundle install --gemfile #{rails_base}/Gemfile --binstubs"
        puts "Creating '#{app_name}' running edge rails (this could take a while)"
        run("rvm gemset use #{app_name} && #{bundle_cmd}")
        run("rvm gemset use #{app_name} && #{rails_base}/bin/rails new #{app_name} --dev #{options.join(" ")}")
        create_project_rvmrc(app_name)
        # TODO: There must be a better way than having to call this a second time
        inside app_name do
          run "bundle install"
        end
        #restore_rvmrc
      end

      private
        def gemfile
          @gemfile ||= <<-EOS
# A sinatra gemfile
source "http://rubygems.org"

gem 'rake', '>= 0.9.0'
gem 'rails', :git => "#{ENV['HOME']}/.flynn/rails_src"
          EOS
        end
    end
  end
end