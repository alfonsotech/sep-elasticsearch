describe Sep::Elasticsearch::Document do
  let(:mock_document) do
    %(
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="noarchive, noodp" />
    <meta name="citation_title" content="Abduction" />
    <meta name="citation_author" content="Douven, Igor" />
    <meta name="citation_publication_date" content="2011/03/09" />
    <meta name="DC.title" content="Abduction" />
    <meta name="DC.creator" content="Douven, Igor" />
    <meta name="DCTERMS.issued" scheme="DCTERMS.W3CDTF" content="2011-03-09" />
    <meta name="DCTERMS.modified" scheme="DCTERMS.W3CDTF" content="2011-03-09" />
    </head>
    <body>
      <div id="preamble">
      <p>

      Zombies in philosophy</p>

      </div>

      <div id="main-text">

      <h2><a name="1">1. the idea of zombies</a></h2>

      <p>

      Descartes held that non-human animals are automata</p>

      <h2><a name="2">2. Zombies and physicalism</a></h2>

      <p>

      Imagine God creating the world and deciding to bring into existence the whole of the
      physical universe.</p>

      </div>
    </body>
    </html>
    )
  end

  let(:expected_output) do
    {
      preamble: '\n      \n\n      Zombies in philosophy\n\n      ',
      main_text: '\n\n      1. the idea of zombies\n\n      \n\n      Descartes held that non-human animals are automata\n\n      2. Zombies and physicalism\n\n      \n\n      Imagine God creating the world and deciding to bring into existence the whole of the\n      physical universe.\n\n      '
    }
  end

  subject(:document) { described_class.new mock_document }

  it 'models SEP documents as JSON' do
    skip
    expect(subject.as_json).to eql expected_output
  end
end
