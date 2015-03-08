# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r3d3/version'

Gem::Specification.new do |spec|
  spec.name          = "r3d3"
  spec.version       = R3d3::VERSION
  spec.authors       = ["Alban Diguer"]
  spec.email         = ["alban.diguer@gmail.com"]

  spec.summary       = %q{Toy robot simulator.}
  spec.description   = %q{Toy robot simulator.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'highline'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
end
