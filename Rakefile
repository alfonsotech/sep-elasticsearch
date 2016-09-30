require 'sep'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :db do
  task :setup do
    `bin/setup`
  end

  task seed: [:setup] do
    loader = Sep::Elasticsearch::BulkLoad.new 'tmp/cache/development/*'

    loader.run
  end
end
