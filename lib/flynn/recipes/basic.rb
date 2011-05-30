module Flynn
  module Recipes
    class Basic < RvmBase
      def create(app_name, options={})
        require 'fileutils'
        puts "Creating #{app_name}"
        FileUtils.mkdir(app_name)
        inside app_name do
          run("bundle init")
        end
        create_project_rvmrc(app_name)
      end
    end
  end
end