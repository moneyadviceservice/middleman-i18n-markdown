# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-i18n-markdown"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rachel Graves", "Ruben Martin"]
  s.homepage    = "http://moneyadviceservice.org.uk"
  s.summary     = %q{Add markdown processing to I18n translation files}
  s.description = %q{Process I18n keys with the option :markdown => true through redcarpet}
  s.license	= "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.1.5"])

  # Additional dependencies
  s.add_runtime_dependency("redcarpet", "~> 3.0.0")
end
