# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'agilecrm_sync/version'

Gem::Specification.new do |spec|
  spec.name          = "agilecrm_sync"
  spec.version       = AgilecrmSync::VERSION
  spec.authors       = ["Javier Gradiche"]
  spec.email         = ["javier.gradiche@keants.com"]

  spec.summary       = %q{Ruby wrapper for AgileCRM Syncro.}
  spec.description   = %q{Ruby wrapper for AgileCRM Syncro.}
  spec.homepage      = "https://github.com/javierkeants"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  # spec.add_development_dependency 'rspec-its'
end
