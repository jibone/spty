# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spty/version"

Gem::Specification.new do |spec|
  spec.name          = "spty"
  spec.version       = Spty::VERSION
  spec.authors       = ["J Shamsul"]
  spec.email         = ["jibone@gmail.com"]

  spec.summary       = %q{Spotify Player Terminal Utility}
  spec.description   = %q{Lets you control your Spotify player from the terminal
                          Currently only works for Mac OSX.}
  spec.homepage      = "https://github.com/jibone/spty-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ['spty']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 9.0"
end
