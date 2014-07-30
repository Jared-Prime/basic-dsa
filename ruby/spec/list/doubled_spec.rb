require 'pry'
require './lib/list/doubled'

describe List::Doubled do
  subject{ described_class.new }
 
  shared_context 'has correct head and tail' do
    specify do
      expect(subject.head.prev_node.data).to eq expected_tail
      expect(subject.tail.next_node.data).to eq expected_head
    end
  end

  shared_context 'has correct order' do
    specify do
      expect(subject.map(&:data)).to eq expected_order
    end
  end

  # @TODO: move to test for List::Cyclical
  describe '#each' do
    it 'detects a loop, stopping iteration' do
      iterations = 0
      subject.insert 'Alice'
      subject.each{ iterations += 1 }
      expect(iterations).to eq 1
    end
  end

  describe '#insert' do
    context 'into an empty list' do
      let(:expected_head){ 'Alice' }
      let(:expected_tail){ 'Alice' }
      before :each do
        subject.insert 'Alice'
      end

      it_behaves_like 'has correct head and tail'
    end

    context 'a list with a single node' do
      let(:expected_head){ 'Bob' }
      let(:expected_tail){ 'Alice' }
      before :each do
        subject.insert 'Alice'
        subject.insert 'Bob'
      end

      it_behaves_like 'has correct head and tail'

      let(:sample){ subject.loc 1 }
      it 'former head retains correct references' do
        expect(sample.next_node.data).to eq 'Bob'
        expect(sample.prev_node.data).to eq 'Bob'
      end
    end

    context 'a list with multiple nodes' do
      let(:expected_head){ 'Carol' }
      let(:expected_tail){ 'Alice' }
      before :each do
        # note this means the last inserted will be head,
        # and second to last inserted will be the tail
        subject.insert 'Alice'
        subject.insert 'Bob'
        subject.insert 'Carol'
      end
      
      it_behaves_like 'has correct head and tail'
    end
  end

  describe '#remove' do
    context 'from an empty list' do
      let(:expected_head){nil}
      let(:expected_tail){nil}
      it 'returns an empty list' do
        subject.remove 'Alice'
        expect(subject.head).to be_nil
      end
    end

    context 'from a list with a single node' do
      let(:expected_head){nil}
      let(:expected_tail){nil}
      it 'returns an empty list' do
        subject.insert 'Alice'
        subject.remove 'Alice'
        expect(subject.head).to be_nil
      end
    end

    context 'a list with multiple nodes' do
      before :each do
        subject.insert 'Alice'
        subject.insert 'Bob'
        subject.insert 'Carol'
        subject.remove target
      end

      context 'no match' do
        let(:target){'Dave'}
        let(:expected_head){'Carol'}
        let(:expected_tail){'Alice'}
        let(:expected_order){ %w{Carol Bob Alice} }

        it_behaves_like 'has correct head and tail'
        it_behaves_like 'has correct order'
      end

      context 'from the head' do
        let(:target){'Carol'}
        let(:expected_head){'Bob'}
        let(:expected_tail){'Alice'}
        let(:expected_order){ %w{Bob Alice} }

        it_behaves_like 'has correct head and tail'
        it_behaves_like 'has correct order'
      end

      context 'from the middle' do
        let(:target){'Bob'}
        let(:expected_head){'Carol'}
        let(:expected_tail){'Alice'}
        let(:expected_order){ %w{Carol Alice} }

        it_behaves_like 'has correct head and tail'
        it_behaves_like 'has correct order'
      end

      context 'from the tail' do
        let(:target){'Alice'}
        let(:expected_head){'Carol'}
        let(:expected_tail){'Bob'}
        let(:expected_order){ %w{Carol Bob} }

        it_behaves_like 'has correct head and tail'
        it_behaves_like 'has correct order'
      end
    end
  end
end
