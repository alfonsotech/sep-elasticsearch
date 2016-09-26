$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sep'
require 'rspec/collection_matchers'

ENV['RACK_ENV'] = 'test'
ENV['ELASTICSEARCH_HOST'] = 'localhost:9250'
