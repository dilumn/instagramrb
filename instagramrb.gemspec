# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'instagramrb/version'

Gem::Specification.new do |spec|
  spec.name          = "instagramrb"
  spec.version       = Instagramrb::VERSION
  spec.authors       = ["DilumN"]
  spec.email         = ["dilumnavanjana@gmail.com"]

  spec.summary       = %q{Ruby wrapper for instagram api}
  spec.description   = %q{Handle instagram api with ruby}
  spec.homepage      = "http://dilumn.github.io"
  spec.license       = "MIT"

  spec.files = %w(LICENSE.txt README.md instagramrb.gemspec) + Dir['bin/*'] + Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "http", "~> 2.0"
  spec.add_development_dependency "json", "~> 1.0"
end
