require 'elasticsearch/extensions/test/cluster'

describe Sep::Elasticsearch::BulkLoad do
  subject { client.search }

  let(:loader) { described_class.new('spec/fixtures/cache/*') }

  before do
    Elasticsearch::Extensions::Test::Cluster.start

    loader.run
  end

  after do
    Elasticsearch::Extensions::Test::Cluster.stop
  end

  let(:client) { ::Elasticsearch::Client.new host: ENV['ELASTICSEARCH_HOST'] }

  it 'indexes each of the documents in the cache' do
    sleep 1
    expect(subject['hits']['total']).to eql 3
  end
end
