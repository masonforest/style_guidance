# -*- encoding: utf-8 -*-
require File.expand_path('../lib/style_guidance/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mason Fischer"]
  gem.email         = ["mason@thoughtbot.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "style_guidance"
  gem.require_paths = ["lib"]
  gem.version       = StyleGuidance::VERSION
end
