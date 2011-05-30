# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "flynn/version"

Gem::Specification.new do |s|
  s.name        = "flynn"
  s.version     = Flynn::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luke Chadwick"]
  s.email       = ["luke.a.chadwick@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Flynn helps create ruby projects of different types}
  s.description = %q{Whenever I start a new ruby project, I usually find myself repeating the same setup steps.
Flynn is a tool to help create common project types with sane defaults. }

  s.rubyforge_project = "flynn"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('activesupport')
  s.add_dependency('i18n')

  s.add_development_dependency('rspec')
  s.add_development_dependency('cover_me')
end
