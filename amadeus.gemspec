
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

  spec.files         = `git ls-files -z`.split('\x0').reject do |f|
    f.match(%r{^(test|spec|features|bin|.github)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print', '~> 1.8.0'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.51.0'
  spec.add_development_dependency 'webmock', '~> 3.1.1'
end
