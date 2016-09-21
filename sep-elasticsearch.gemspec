# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sep/elasticsearch/version'

files = `git ls-files -z`.split("\x0").reject do |f|
  f.match(%r{^(test|spec|features)/})
end

Gem::Specification.new do |spec|
  spec.name          = 'sep-elasticsearch'
  spec.version       = Sep::Elasticsearch::VERSION
  spec.authors       = ['Richard Massey']
  spec.email         = ['rwassey@gmail.com']

  spec.summary       = 'Gather data from Stanford Encyclopedia of Philosophy'
  spec.homepage      = 'https://github.com/rwassey/sep-elasticsearch'

  spec.files         = files
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'sidekiq'
  spec.add_dependency 'rack'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rspec-collection_matchers'
  spec.add_development_dependency 'rubocop'
end
