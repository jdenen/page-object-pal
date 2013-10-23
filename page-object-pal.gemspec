# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'page-object-pal/version'

Gem::Specification.new do |spec|
  spec.name          = "page-object-pal"
  spec.version       = PageObjectPal::VERSION
  spec.authors       = ["Johnson Denen"]
  spec.email         = ["jdenen@manta.com"]
  spec.description   = %q{Did the test suite find a bug? Or are the page objects outdated by new code? PageObjectPal will keep an eye on your page objects and let you know when they need some TLC.}
  spec.summary       = %q{Page object maintenance made easier}
  spec.homepage      = "http://github.com/jdenen/page-object-pal"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.12.0"
  spec.add_development_dependency "rspec-given", "~> 3.1.1"
  spec.add_development_dependency "page-object", "~> 0.9.2"
end
