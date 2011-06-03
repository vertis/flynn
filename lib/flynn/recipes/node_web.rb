require 'fileutils'

module Flynn
  module Recipes
    class NodeWeb
      include Flynn::Helpers

      def create(app_name, options=[])
        check_for_node
        check_for_npm
        FileUtils.mkdir_p(app_name)
        inside app_name do
          create_file('app.js', <<-CONTENT
var express = require('express');

var app = express.createServer(express.logger());

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 3000;
console.log("Listening on " + port);

app.listen(port);
          CONTENT
          )
          create_file('package.json', %Q|
{
  "name": "#{app_name}",
  "version": "0.0.1",
  "dependencies": {
    "express": "2.2.0"
  }
}
|
        )
        FileUtils.mkdir_p('public')
        FileUtils.mkdir_p('views')
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