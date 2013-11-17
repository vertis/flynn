module Flynn
  module Recipes
    class Basic
      def create(app_name, options={})
        require 'fileutils'
        puts "Creating #{app_name}"
        FileUtils.mkdir(app_name)
        inside app_name do
          run("bundle init")
        end
      end
    end
  end
end