require './lib/stack'

describe Stack do
  subject{ described_class.new }

  describe '.initialize' do
    it 'uses a List::Linked as an underlying data structure' do
      expect(subject.contents).to be_a List::Linked
    end

    it 'creates an empty Stack' do
      expect(subject.empty?).to be true
    end
  end

  describe '#push' do
    context 'into an empty Stack' do
      it 'inserts at the head' do
        subject.push 1
        expect(subject.head.data).to be 1
      end
    end

    context 'into a populated Stack' do
      before :each do
        subject.push 1
      end

      context 'with one item' do
        it 'inserts at the head' do
          subject.push 2
          expect(subject.head.data).to be 2
        end
      end

      context 'with multiple items' do
        it 'inserts at the head' do
          subject.push 2
          subject.push 3
          expect(subject.head.data).to be 3
        end

      end
    end
  end
end
