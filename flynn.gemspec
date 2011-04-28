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
  s.summary     = %q{Create new projects of different types}
  s.description = %q{Create new projects of different types}

  s.rubyforge_project = "flynn"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("thor")
end
