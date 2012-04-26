# -*- encoding: utf-8 -*-
require File.expand_path('../lib/octopart/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eric J. Holmes"]
  gem.email         = ["eric@ejholmes.net"]
  gem.description   = %q{Ruby gem for the Octopart API}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/ejholmes/octopart"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "octopart"
  gem.require_paths = ["lib"]
  gem.version       = Octopart::VERSION

  gem.add_dependency 'hashie'
  gem.add_dependency 'json'
  gem.add_dependency 'rest-client'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'fakeweb'
end
