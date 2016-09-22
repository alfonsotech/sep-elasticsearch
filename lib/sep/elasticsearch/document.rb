require 'nokogiri'

module Sep
  module Elasticsearch
    class Document
      def initialize(html_string)
        @html_string = html_string
      end

      def as_json
        { preamble: preamble, main_text: main_text }
      end

      private

      attr_reader :html_string

      def main_text
        parsed_document.css('#main-text').text
      end

      def preamble
        parsed_document.css('#preamble').text
      end

      def parsed_document
        @parsed_document ||= Nokogiri::HTML html_string
      end
    end
  end
end
