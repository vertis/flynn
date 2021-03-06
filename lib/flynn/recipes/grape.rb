require 'fileutils'

module Flynn
  module Recipes
    class Grape
      def create(app_name, options=[])
        @app_name = app_name
        puts "Creating #{app_name}"
        FileUtils.mkdir(app_name)
        create_gemfile
        create_config_ru
        create_app_rb
        create_standard_directories

        inside(@app_name) do
          run("bundle install")
        end
      end

      private
        def create_gemfile
          inside(@app_name) do
            File.open("Gemfile", 'w') {|f| f.write(gemfile) }
          end
        end

        def create_config_ru
          inside(@app_name) do
            File.open("config.ru", 'w') {|f| f.write(config_ru) }
          end
        end

        def create_app_rb
          inside(@app_name) do
            File.open("app.rb", 'w') {|f| f.write(app_rb) }
          end
        end

        def create_standard_directories
          inside(@app_name) do
            FileUtils.mkdir_p('views')
            FileUtils.mkdir_p('public')
          end
        end

        def config_ru
          @config_ru ||= <<-EOS
require "./app" # ruby1.9 compatible

run #{@app_name.classify}API
          EOS
        end

        def app_rb
          @app_rb ||= <<-EOS
require 'rubygems'
require 'bundler/setup'
require 'grape'

class #{@app_name.classify}API < Grape::API
  version 'v1', :using => :header, :vendor => '#{@app_name}'
  
  desc "Returns foo", { :params => { "id" => "a required id" } }
  get 'foo/:id' do
    { 'foo' => params[:id] }
  end
end  
          EOS
        end

        def gemfile
          @gemfile ||= <<-EOS
            # A sinatra gemfile
            source "http://rubygems.org"

            gem 'grape'
          EOS
        end
    end
  end
end
