module Flynn
  module Recipes
    class RvmBase
      include Flynn::Helpers

      def initialize
        load_rvm
      end

      protected

      def create_project_rvmrc(app_name)
        rvmrc = <<-RVMRC
        rvm_gemset_create_on_use_flag=1
        rvm use #{@ruby_version}@#{app_name}
        RVMRC
        File.open("#{app_name}/.rvmrc", 'w') {|f| f.write(rvmrc) }
        system("cd #{app_name} && rvm rvmrc trust")
      end

      private
        def restore_rvmrc
          FileUtils.mv('.rvmrc_backup','.rvmrc')
        end

        def disable_rvmrc
          FileUtils.mv('.rvmrc','.rvmrc_backup')
        end

        def load_rvm
          return true if defined?(RVM)
          puts "Loading RVM"
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