require './lib/graph/search/breadth_first'
require './lib/graph/vertex'
require './lib/graph/edge'

describe Graph::Search::BreadthFirst do
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
    context 'vertex exists' do
      it 'returns immediately with the root' do
        expect(subject.run(germany, 'Frankfurt')).to eq frankfurt
      end

      it 'returns in O(n) time with the furthest target' do
        iterations = 1
        expect(subject.run(germany, 'Munchen'){ iterations += 1 }).to eq munchen
        expect(iterations).to eq 6
      end
    end

    context 'vertex does not exist' do
      specify do
        expect(subject.run(germany, 'Paris')).to be_nil
      end
    end
  end
end
