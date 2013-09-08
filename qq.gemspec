# -*- encoding: utf-8 -*-
require File.expand_path('../lib/qq/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["veggie"]
  gem.email         = ["kkxlkkxllb@gmail.com"]
  gem.description   = %q{QQ oauth2}
  gem.summary       = %q{QQ oauth2}
  gem.homepage      = "https://github.com/17up/qq_17up"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "qq_17up"
  gem.require_paths = ["lib"]

  gem.add_dependency 'rest-client'

  gem.version       = Qq::VERSION
end
