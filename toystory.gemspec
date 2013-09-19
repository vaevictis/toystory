# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toystory/version'

Gem::Specification.new do |spec|
  spec.name          = "toystory"
  spec.version       = Toystory::VERSION
  spec.authors       = ["Guillaume Hammadi"]
  spec.email         = ["ghammadi@gmail.com"]
  spec.description   = %q{Simple game to control a robot on a square table}
  spec.summary       = %q{Assignment for a job offer. The goal is to control a virtual robot on a square table through text files containing a definite seriess of moves.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake', '~> 0.9.2')
  spec.add_dependency('methadone', '~> 1.3.0')
  spec.add_development_dependency('rspec')
end
