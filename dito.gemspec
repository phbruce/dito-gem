# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dito/version'

Gem::Specification.new do |spec|
  spec.name          = "dito"
  spec.version       = Dito::VERSION
  spec.authors       = ["Marcos Nogueira"]
  spec.email         = ["marcos.nogueira@dito.com.br"]
  spec.summary       = %q{Gem para integração com a plataforma da Dito}
  spec.description   = %q{Essa gem tem como objetivo automatizar a integração com a Rest API da Dito.}
  spec.homepage      = "http://dito.com.br/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
end
