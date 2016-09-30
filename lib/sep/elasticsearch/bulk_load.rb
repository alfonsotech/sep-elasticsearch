require 'active_support/core_ext/array'

module Sep
  module Elasticsearch
    class BulkLoad
      def initialize(host)
        @host = host
      end

      # FIXME!!!
      def run
        tuples.in_groups_of(1000, false) do |batch|
          client.bulk body: batch
        end
      end

      private

      attr_reader :host, :entry

      def client
        @client ||= ::Elasticsearch::Client.new host: ENV['ELASTICSEARCH_HOST']
      end

      # TODO use a database
      def cache
        @cache ||= Dir.glob host
      end

      def tuples
        @tuples ||= cache.reduce([]) do |tuples, entry|
          @entry = entry

          tuples += [doc.header, doc.as_json]
        end
      end

      def doc
        file = File.read "#{entry}"

        Sep::Elasticsearch::Document.new file
      end
    end
  end
end
