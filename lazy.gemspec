# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name                  = 'lazy_cli'
  gem.version               = '0.0.3'
  gem.authors               = ['AndrewRPorter']
  gem.email                 = ['pavelow53.andrew@gmail.com']
  gem.summary               = 'Analyze command history and suggest aliases so you can type less.'
  gem.homepage              = 'http://github.com/AndrewRPorter/lazy'
  gem.license               = 'MIT'
  gem.files                 = `git ls-files ./lib`.split($/)
  gem.executables           = ['lazy_cli']
  gem.require_paths         = ['lib']
end
