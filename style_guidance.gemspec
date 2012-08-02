# -*- encoding: utf-8 -*-
require File.expand_path('../lib/style_guidance/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mason Fischer"]
  gem.email         = ["mason@thoughtbot.com"]
  gem.description   = %q{Rails Rake tasks for enforcing propper style}
  gem.summary       = %q{Rake tasks for fixing single vs double quoted strings}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "style_guidance"
  gem.require_paths = ["lib"]
  gem.version       = StyleGuidance::VERSION
end
