# coding: utf-8
# Copyright (c) 2016 Freescale Semiconductor Inc.
Gem::Specification.new do |spec|
  spec.name          = "ruby-dita"
  spec.version       = '0.3.1'
  spec.authors       = ["Peter Kong"]
  spec.email         = ["peter.kong@nxp.com"]
  spec.summary       = %q{Ruby to DITA API}
  spec.description   = "Please read the README.md for the purpose of this file."
  spec.homepage      = "https://github.com/ludocracy/ruby-dita"
  spec.license       = "MIT"
  spec.required_ruby_version     = '>= 1.9.3'
  spec.required_rubygems_version = '>= 1.8.11'

  spec.files         = Dir["lib/**/*.rb", "xml/**/*.xml"
  ]
  spec.require_paths = ["lib"]

  # Don't add any logic to runtime dependencies, for example to install a specific gem
  # based on Ruby version.
  # Rubygems / Bundler do not support this and you will need to find another way around it.
  spec.add_runtime_dependency "duxml", "~>0.8"
end