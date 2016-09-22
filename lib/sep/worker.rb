require 'sidekiq'
require 'fileutils'

module Sep
  # @doc lib/sep/worker.rb
  #
  # @desc Worker for collecting documents from SEP
  #
  # @usage
  #
  # ```ruby
  # Worker.perform href
  # ```
  class Worker
    include Sidekiq::Worker

    def perform(href)
      @href = href

      @doc = Net::HTTP.get uri

      write_to_disk
    end

    private

    attr_reader :doc, :href

    def uri
      URI "http://plato.stanford.edu/#{href}"
    end

    def write_to_disk
      FileUtils.mkdir_p db_path

      File.open(qualified_file_path, 'w'){ |f| f.write doc }
    end

    def qualified_file_path
      "#{db_path}/#{href.gsub(/\W/, '_')}".freeze
    end

    def db_path
      "tmp/cache/#{env}".freeze
    end

    def env
      ENV.fetch 'RACK_ENV', 'development'
    end
  end
end
