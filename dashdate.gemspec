# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dashdate/version'
require 'require_all'

Gem::Specification.new do |spec|
  spec.name          = "dashdate"
  spec.version       = Dashdate::VERSION
  spec.authors       = ["Kyle McKee"]
  spec.email         = ["mckee.kyle@gmail.com"]
  spec.summary       = %q{Update your Dashing dashboards from the command line.}
  spec.description   = %q{This gem allows you to update Dashing dashboards from a command line.}
  spec.homepage      = "http://aptobits.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['dashdate'] 
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.0"
  spec.add_development_dependency "rspec-mocks", "~>2.0"
  spec.add_dependency "require_all", "~> 1.3"
  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "trollop", "~> 2.0"
end
