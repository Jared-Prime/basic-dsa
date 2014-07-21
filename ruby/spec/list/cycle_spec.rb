require 'pry'
require './lib/list/cycle'
require './lib/list/node'

describe List::Cycle do
  subject { described_class.new }
  let(:expected_head){ 'Alice' }

  # @TODO: move to test for List::Cyclical
  shared_context 'has correct head and tail' do
    specify do
      expect(subject.head.data).to eq expected_head
      expect(subject.head.next_node.data).to eq expected_tail
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

  describe '#find_data' do
    before :each do
      subject.insert expected_head
    end

    it 'returns the node matching the data' do
      subject.insert 'Bob'
      found_node = subject.find_data 'Bob'
      expect(found_node).to be_a List::Node
      expect(found_node.data).to eq 'Bob'
      expect(found_node.next_node.data).to eq 'Alice'
    end
  end

  describe '#insert' do
    let(:expected_tail){ 'Bob' }

    context 'into an empty list' do
      let(:expected_tail){ expected_head }
      before :each do
        subject.insert expected_head
      end

      it_behaves_like 'has correct head and tail'
    end

    context 'into a single element list' do
      before :each do
        subject.insert expected_tail
        subject.insert expected_head
      end

      it_behaves_like 'has correct head and tail'
    end

    context 'into a multiple element list' do
      before :each do
        subject.insert expected_tail
        subject.insert 'Dave'
        subject.insert expected_head
      end

      it_behaves_like 'has correct head and tail'
    end
  end

  describe '#remove' do
    context 'list with one element' do
      before :each do
        subject.insert 'Alice'
      end
      specify do
        subject.remove 'Alice'
        expect(subject.data).to be_empty
      end
    end

    context 'an empty list' do
      specify do
        subject.remove 'Dave'
        expect(subject.data).to be_empty
      end
    end

    context 'list with multiple elements' do
      before :each do
        subject.insert 'Alice'
        subject.insert 'Bob'
        subject.insert 'Carol'
      end

      context 'no matching data' do
        specify do
          subject.remove 'Dave'
          expect(subject.data).to eq %w{Carol Alice Bob}
        end
      end

      context 'data matching the head' do
        specify do
          subject.remove 'Carol'
          expect(subject.data).to eq %w{Alice Bob}
        end
      end

      context 'data somewhere in the middle' do
        specify do
          subject.remove 'Alice'
          expect(subject.data).to eq %w{Carol Bob}
        end
      end

      context 'data matching the tail' do
        specify do
          subject.remove 'Bob'
          expect(subject.data).to eq %w{Carol Alice}
        end
      end
    end
  end
end
