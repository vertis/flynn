module Flynn
  module Recipes
    class AbstractRecipe
      def initialize
        puts "Loading RVM"
        load_rvm
      end

      protected
        # def install_gem(*options)
        #   require 'rubygems/gem_runner'
        #   require 'rubygems/exceptions'
        #
        #   required_version = Gem::Requirement.new ">= 1.8.7"
        #
        #   unless required_version.satisfied_by? Gem.ruby_version then
        #     abort "Expected Ruby Version #{required_version}, is #{Gem.ruby_version}"
        #   end
        #
        #   begin
        #     Gem::GemRunner.new.run options
        #   rescue Gem::SystemExitException => e
        #     exit e.exit_code
        #   end
        # end

        def create_project_rvmrc(app_name)
          rvmrc = <<-RVMRC
          rvm_gemset_create_on_use_flag=1
          rvm #{@ruby_version}@#{app_name}
          RVMRC
          File.open("#{app_name}/.rvmrc", 'w') {|f| f.write(rvmrc) }
          system("cd #{app_name} && rvm rvmrc trust")
        end

      private
        def load_rvm
          # load in RVM environment
          if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
            begin
              rvm_path     = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
              rvm_lib_path = File.join(rvm_path, 'lib')
              $LOAD_PATH.unshift rvm_lib_path

              require 'rvm'
              @ruby_version = ENV['RUBY_VERSION']
            rescue LoadError
              # RVM is unavailable at this point.
              raise "RVM ruby lib is currently unavailable."
            end
          else
            raise "RVM ruby lib is currently unavailable."
          end
        end
    end
  end
end