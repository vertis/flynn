# Flynn

Flynn is an open source command line tool for easily bootstrapping new projects. It is a lightweight framework designed to meet the following goals: One command to start new projects, easily pluggable (allowing users to write their own *recipes*), simple configuration, and readable and maintainable code.

The tool currently hooks into RVM heavily for the creation of ruby projects. There should be very few other dependencies. *Recipes* are responsible for installing anything (read: gems) they need.

## Installation & Your first project

* Install Ruby 1.9 (via RVM or natively)

        $> gem install rvm
        $> rvm install <your favorite ruby>
        $> rvm use --default <your favorite ruby>

* Install Flynn:

        $> gem install flynn

 * Create a new rails3 project:

        $> flynn rails3 awesomeproject -J -O -m ../templates/heroku_template.rb

## Writing your own recipe: MySinatra

    $> mate ~/.flynn/recipes/my_sinatra.rb
    class Flynn::Recipes::MySinatra
      def create(app_name, options=[])
        # Do whatever tasks you want
      end
    end

Flynn will automatically load any ruby files within this directory.

##Contributing

Fork on GitHub, create a test & send a pull request.

##Bugs

Use the [Issue Tracker](http://github.com/vertis/flynn/issues)

## License & Acknowledgments

Flynn is distributed under the MIT license, for full details please see the LICENSE file.

