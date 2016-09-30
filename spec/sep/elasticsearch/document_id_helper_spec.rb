describe Sep::Elasticsearch::DocumentIdHelper do
  describe '#to_s' do
    context 'when initialized with a parsed document' do
      let(:stubbed_document) { File.read 'spec/fixtures/cache/entries_zombies_' }

      let(:parsed_document){ Nokogiri::HTML stubbed_document }

      let(:expected_output) { 'zombieskirkrobert1062979200' }

      subject { described_class.new parsed_document }

      it 'returns an ID based on the document metadata' do
        expect(subject.to_s).to eql expected_output
      end
    end
  end
end
