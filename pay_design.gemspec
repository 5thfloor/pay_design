# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pay_design/version'

Gem::Specification.new do |spec|
  spec.name          = "pay_design"
  spec.version       = PayDesign::VERSION
  spec.authors       = ["tnzk"]
  spec.email         = ["tnzk@tnzk.org"]
  spec.licenses      = ["MIT"]

  spec.summary       = %q{Pay by PayDesign}
  spec.description   = %q{A think wrapper of PayDesign API for convenience store payment, pay-easy and some more.}
  spec.homepage      = "http://github.com/tnzkorg/pay_design"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", ">= 2.1.0"
end
