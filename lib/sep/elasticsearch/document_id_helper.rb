module Sep
  module Elasticsearch
    class DocumentIdHelper
      def initialize(parsed_document)
        @parsed_document = parsed_document
      end

      def to_s
        (values[0..1].join('') + timestamp).gsub(/\W/, '').downcase
      end

      private

      attr_reader :parsed_document

      def timestamp
        last_node = values[-1]

        DateTime.parse(last_node).to_time.to_i.to_s
      end

      def nodes
        parsed_document.css('meta').select do |node|
          NODE_NAMES.include? node['name']
        end
      end

      def values
        nodes.map { |node| node['content'] }
      end

      NODE_NAMES = %w(citation_title citation_author citation_publication_date)

      private_constant :NODE_NAMES


    end
  end
end
