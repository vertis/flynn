require 'fileutils'
require 'erb'

module Flynn
  module Recipes
    class NodeWeb
      include Flynn::Helpers

      def create(app_name, options=[])
        namespace = lambda do
          @app_name = app_name
          @app_description = ""

          #TODO: make this pull from your git details if they exist
          @app_author = "You"
          @app_author_email = "you@yourdomain.com"
        end.call

        check_for_node
        check_for_npm

        run("git clone https://github.com/vertis/flynn-node-template.git #{app_name}")
        inside app_name do
          template = ERB.new(File.read('package.json.erb'), nil)
          create_file('package.json', template.result(namespace.send(:binding)))
          run('rm package.json.erb')
          run('git remote rm origin 2>/dev/null >/dev/null') # Borrowed from https://github.com/mwotton/instigator
          run("npm install")
        end
      end

      private
        # Warn and exit if node.js isn't installed
        def check_for_node
          unless executable_path('node')
            $stderr.puts "node.js is not installed"
            throw Exception.new('node.js is not installed')
          end
        end

        def check_for_npm
          unless executable_path('npm')
            install_npm
          end
        end

        def install_npm
          run("curl http://npmjs.org/install.sh | sh")
        end
    end
  end
end