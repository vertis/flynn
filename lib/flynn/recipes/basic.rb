module Flynn
  module Recipes
    class Basic < AbstractRecipe
      def create(app_name, options={})
        require 'fileutils'
        puts "Creating #{app_name}"
        FileUtils.mkdir(app_name)
        FileUtils.chdir(app_name)
        system("bundle init")

        rvmrc = <<-RVMRC
        rvm_gemset_create_on_use_flag=1
        rvm #{@ruby_version}@#{app_name}
        RVMRC
        File.open(".rvmrc", 'w') {|f| f.write(rvmrc) }
        system("rvm rvmrc trust")
        FileUtils.chdir('..')
      end
    end
  end
end