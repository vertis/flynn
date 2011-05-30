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

desc "Install in the global gemset"
task :install_global => ['build'] do
  system("rvm gemset use global && gem install pkg/flynn-#{Flynn::VERSION}.gem")
end
