module Sep
  module Elasticsearch
    class BulkLoad
      def initialize(host)
        @host = host
      end

      def run
        client.bulk body: tuples
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
        cache.reduce([]) do |tuples, entry|
          @entry = entry

          tuples += [doc.header, doc.as_json]
        end
      end

      def doc
        file = File.read "#{entry}"

        @doc ||= Sep::Elasticsearch::Document.new file
      end
    end
  end
end
