require './lib/stack'

describe Stack do
  subject{ described_class.new }

  describe '.initialize' do
    it 'uses a Node as a container for data' do
      expect(subject.top).to be_nil
      subject.push 1
      expect(subject.top).to be_a Node
    end

    it 'creates an empty Stack' do
      expect(subject.empty?).to be true
    end
  end

  describe '#push' do
    context 'into an empty Stack' do
      it 'inserts at the top' do
        subject.push 1
        expect(subject.top.data).to be 1
      end
    end

    context 'into a populated Stack' do
      before :each do
        subject.push 1
      end

      context 'with one item' do
        it 'inserts at the top' do
          subject.push 2
          expect(subject.top.data).to be 2
        end
      end

      context 'with multiple items' do
        it 'inserts at the top' do
          subject.push 2
          subject.push 3
          expect(subject.top.data).to be 3
        end

      end
    end
  end

  describe '#pop' do
    context 'from an empty Stack' do
      it 'returns nil' do
        expect(subject.pop).to be_nil
      end
    end

    context 'from a populated Stack' do
      before :each do
        subject.push 1
        subject.push 2
      end
      it 'returns the last inserted element' do
        expect(subject.pop).to be 2
        expect(subject.pop).to be 1
      end
    end
  end
end
