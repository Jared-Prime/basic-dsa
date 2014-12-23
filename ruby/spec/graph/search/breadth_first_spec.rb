require './lib/graph/search/breadth_first'
require './lib/graph/vertex'
require './lib/graph/connected'

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

  let(:default_cost){ nil }
  let(:germany) do
    Graph::Connected.generate([[frankfurt, wurtzburg],
                               [frankfurt, kassel],
                               [wurtzburg, nurnberg],
                               [nurnberg, munchen],
                               [nurnberg, stuttgart],
                               [munchen, kassel]])
    return frankfurt
  end

  describe '.run' do
    context 'vertex exists' do
      it 'finds all vertices' do
        expect(subject.run(germany, 'Frankfurt')).to eq frankfurt
        expect(subject.run(germany, 'Wurtzburg')).to eq wurtzburg
        expect(subject.run(germany, 'Nurnberg')).to eq nurnberg
        expect(subject.run(germany, 'Munchen')).to eq munchen
        expect(subject.run(germany, 'Stuttgart')).to eq stuttgart
        expect(subject.run(germany, 'Kassel')).to eq kassel
      end

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
        expect{ subject.run(germany, 'Paris') }.to raise_error
      end
    end
  end
end
