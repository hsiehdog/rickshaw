# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rickshaw/version'

Gem::Specification.new do |spec|
  spec.name          = "rickshaw"
  spec.version       = Rickshaw::VERSION
  spec.authors       = ["Mike Hsieh"]
  spec.email         = ["hsieh@alumni.stanford.edu"]
  spec.description   = %q{Ruby wrapper for Rickshaw's API.}
  spec.summary       = %q{Ruby wrapper for Rickshaw's API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  
end
