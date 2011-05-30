require 'bundler'
Bundler::GemHelper.install_tasks

begin
  require 'cover_me'

  desc "Produce the coverage report"
  task :coverage do
    CoverMe.complete!
  end
rescue LoadError
  $stderr.puts "cover_me gem is not installed"
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

desc "Install in the global gemset"
task :install_global => [:build] do
  load_rvm
  RVM.gemset_use! 'global'
  system("gem install pkg/flynn-#{Flynn::VERSION}.gem")
end
