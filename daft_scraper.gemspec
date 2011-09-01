# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "daft_scraper/version"

Gem::Specification.new do |s|
  s.name        = "daft_scraper"
  s.version     = DaftScraper::VERSION
  s.authors     = ["David Tuite"]
  s.email       = ["dtuite@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "daft_scraper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"

  s.add_runtime_dependency "mechanize"
  s.add_runtime_dependency "activerecord"
end
