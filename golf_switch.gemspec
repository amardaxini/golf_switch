# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'golf_switch/version'

Gem::Specification.new do |gem|
  gem.name          = "golf_switch"
  gem.version       = GolfSwitch::VERSION
  gem.authors       = ["amardaxini"]
  gem.email         = ["amardaxini@gmail.com"]
  gem.description   = %q{Ruby Wrapper of golf switch API}
  gem.summary       = %q{Ruby Wrapper of golf switch API more info devxml.golfswitch.com/examples/definitions.htm,https://devxml.golfswitch.com/golfservice.asmx}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('savon', '~> 2.1.0')
end
