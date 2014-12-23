require './lib/graph/search/dijkstra'
require './lib/graph/vertex'

describe Graph::Search::Dijkstra do
  subject { described_class }

  # use a portion of the example graph given at
  # http://en.m.wikipedia.org/wiki/Breadth-first_search#Pseudocode
  let(:frankfurt) { Graph::Vertex.new 'Frankfurt' }
  let(:wurtzburg) { Graph::Vertex.new 'Wurtzburg' }
  let(:nurnberg) { Graph::Vertex.new 'Nurnberg' }
  let(:munchen) { Graph::Vertex.new 'Munchen' }
  let(:stuttgart) { Graph::Vertex.new 'Stuttgart' }
  let(:kassel) { Graph::Vertex.new 'Kassel' }

  let(:germany) do
    frankfurt.connect wurtzburg
    frankfurt.connect kassel
    wurtzburg.connect nurnberg
    nurnberg.connect munchen
    nurnberg.connect stuttgart
    munchen.connect kassel
    return frankfurt # treat as root
  end

  describe '.run' do
    it 'finds the shortest path' do
      expect(subject.run(germany, frankfurt, munchen)).to eq []
    end
  end
end
