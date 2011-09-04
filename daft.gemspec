# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "daft/version"

Gem::Specification.new do |s|
  s.name        = "daft"
  s.version     = Daft::VERSION
  s.authors     = ["David Tuite"]
  s.email       = ["dtuite@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Gem to facilitate easy scraping of Daft property website}
  s.description = %q{Gem to facilitate easy scraping of Daft property website}

  s.rubyforge_project = "daft"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "fakeweb"

  s.add_runtime_dependency "mechanize"
  s.add_runtime_dependency "activerecord"
  s.add_runtime_dependency "nokogiri"
end
