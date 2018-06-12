lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amadeus/version'

Gem::Specification.new do |spec|
  spec.name          = 'amadeus'
  spec.version       = Amadeus::VERSION
  spec.authors       = ['Amadeus', 'Cristiano Betta']
  spec.email         = ['developer@amadeus.com', 'cristiano@betta.io']

  spec.summary       = 'Amadeus travel APIs'
  spec.description   = <<-DESCRIPTION
    Ruby library for the Amadeus travel APIs, providing hotel, flight, airport,
    and other travel related APIs.
  DESCRIPTION
  spec.homepage      = 'https://github.com/amadeus4dev/amadeus-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features|.github|docs|doc|.gitignore|.rspec)/) ||
      f.match(/^(.rubocop.yml|.simplecov|.travis.yml|.yardopts)/) ||
      f.match(/^(CODE_OF_CONDUCT|Rakefile|Guardfile|Gemfile)/)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2.0'

  spec.add_development_dependency 'awesome_print', '~> 1.8'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'guard', '~> 2.14'
  spec.add_development_dependency 'guard-rake', '~> 1.0'
  spec.add_development_dependency 'guard-yard', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.52'
  spec.add_development_dependency 'simplecov', '~> 0.15'
  spec.add_development_dependency 'vcr', '~> 4.0'
  spec.add_development_dependency 'webmock', '~> 3.3'
  spec.add_development_dependency 'yard', '~> 0.9.12'
end
