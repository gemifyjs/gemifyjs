# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bud-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "bud-rails"
  gem.version       = Bud::Rails::VERSION
  gem.authors       = "asdf"
  gem.email         = "aedf@sdf.com"
  gem.description   = "asdf"
  gem.summary       = ""
  gem.homepage      = ""
  gem.license       = "MIT"
  
  gem.add_dependency "railties"
  gem.add_dependency "thor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end