describe Sep::Worker do
  let(:fixture_file) { File.read 'spec/fixtures/zombies.html' }

  before { described_class.new.perform('/entries/zombies/') }

  subject { File.read 'tmp/cache/test/_entries_zombies_' }

  after { `rm -rf tmp/cache/test` }

  it 'downloads a document from SEP' do
    expect(subject).to eql fixture_file
  end
end
