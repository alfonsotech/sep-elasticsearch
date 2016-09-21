require 'vcr_helper'

describe Sep::Contents do
  let(:fixture_file) { File.read 'spec/fixtures/contents.html' }

  subject { described_class.new }

  before { expect(subject).to receive(:body).and_return fixture_file }

  describe '#fetch' do
    it 'creates a job for each entry in the SEP body of contents' do
      expect(Sep::Worker).to receive(:perform).exactly(2087).times

      subject.fetch
    end
  end
end
