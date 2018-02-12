
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amadeus/version'

Gem::Specification.new do |spec|
  spec.name          = 'amadeus'
  spec.version       = Amadeus::VERSION
  spec.authors       = ['Amadeus', 'Cristiano Betta']
  spec.email         = ['developer@amadeus.com', 'cristiano@betta.io']

  spec.summary       = 'Ruby library for the Amadeus travel APIs'
  spec.description   = 'Ruby library for the Amadeus travel APIs'
  spec.homepage      = 'https://github.com/amadeusdev/amadeus-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features|.github|docs|.gitignore|.rspec)/) ||
      f.match(/^(.rubocop.yml|.simplecov|.travis.yml|.yardopts)/) ||
      f.match(/^(CODE_OF_CONDUCT|Rakefile|Guardfile|Gemfile)/)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print', '~> 1.8.0'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'guard', '~> 2.14.1'
  spec.add_development_dependency 'guard-rake', '~> 1.0.0'
  spec.add_development_dependency 'guard-yard', '~> 2.2.0'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'simplecov', '~> 0.15.1'
  spec.add_development_dependency 'vcr', '~> 4.0.0'
  spec.add_development_dependency 'webmock', '~> 3.3.0'
end
