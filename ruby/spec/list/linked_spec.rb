require 'pry'
require './lib/list/linked'
require './lib/list/node'

describe List::Linked do
  subject{ described_class.new }
  let(:expected_head){ 'Alice' }
  let(:expected_tail){ %w{Bob Carol} }

  before :each do
    subject.insert expected_head
  end

  shared_context 'an empty list' do
    specify do
      expect(returned_list.head).to be_nil
    end
  end

  shared_context 'a populated list' do
    specify do
      expect(returned_list.head).to be expected_head
    end
  end

  shared_context 'modifies list with new data' do
    before :each do
      expect(subject.data).to eq [expected_head]
    end

    specify do
      subject.send(described_method, datum)
      expect(subject.data).to eq expected_data
    end
  end

  describe '#find_data' do
    it 'returns the node matching the data' do
      subject.insert 'Bob'
      found_node = subject.find_data 'Bob'
      expect(found_node).to be_a List::Node
      expect(found_node.data).to eq 'Bob'
      expect(found_node.next_node.data).to eq 'Alice'
    end
  end

  describe '#each' do
    it 'traverses the list in O(n) time' do
      iterations = 0
      subject.each{ iterations += 1 }
      expect(iterations).to eq 1
    end
  end

  describe '#insert' do
    let(:datum){ 'Dave' }
    let(:expected_data){ %w{Dave Alice} }
    let(:described_method){ :insert }
    it_behaves_like 'modifies list with new data'
  end

  describe '#sorted_insert' do
    let(:datum){ 'Dave' }
    let(:expected_data){ %w{Alice Dave} }
    let(:described_method){ :sorted_insert }
    it_behaves_like 'modifies list with new data'
  end

  describe '#remove' do
    let(:described_method){ :remove }

    context 'list with one node' do
      it 'returns and empty list' do
        subject.remove 'Alice'
        expect(subject.data).to be_empty
      end
    end

    context 'no matching node' do
      let(:datum){ 'Zach' }
      let(:expected_data){ [expected_head] }
      it_behaves_like 'modifies list with new data'
    end

    context 'on list with multiple nodes' do
      before :each do
        subject.sorted_insert 'Bob'
        subject.sorted_insert 'Carol'
      end

      context 'targeting first node' do
        specify do
          subject.remove 'Alice'
          expect(subject.data).to eq %w{Bob Carol}
        end
      end

      context 'targeting intermediate node' do
        specify do
          subject.remove 'Bob'
          expect(subject.data).to eq %w{Alice Carol}
        end
      end

      context 'targeting last node' do
        specify do
          subject.remove 'Carol'
          expect(subject.data).to eq %w{Alice Bob}
        end
      end
    end
  end
end
