require 'nokogiri'
require 'net/http'
require 'sep/worker'

module Sep
  # @doc lib/sep/contents.rb
  # @desc
  #
  # Represents the table of contents for the SEP
  #
  # This class models the table of contents for SEP.
  #
  # Contents#fetch will queue up a set of workers to fetch the body
  # of all articles in the SEP.
  #
  # NOTE: This class should be used to collect content for the first time.
  # The WhatsNew class is responsible for gathering updates to existing content.
  #
  # @usage
  #
  # ```ruby
  # contents = Contents.new
  #
  # contents.fetch
  # ```
  class Contents
    def fetch
      to_a.each do |link|
        Sep::Worker.perform_async link['href']
      end
    end

    private

    def to_a
      doc.css('a').select { |link| link['href'] =~ /entries/ }
    end

    def uri
      URI 'http://plato.stanford.edu/contents.html'
    end

    def body
      @body ||= Net::HTTP.get uri
    end

    def doc
      @doc ||= Nokogiri::HTML body
    end
  end
end
