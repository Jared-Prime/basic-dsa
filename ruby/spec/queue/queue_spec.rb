require './lib/queue/queue'
require './lib/queue/node'

describe Queue::Queue do
  subject { described_class.new }

  describe '.initialize' do
    it 'creates an empty queue' do
      expect(subject.head).to be_nil
      expect(subject.tail).to be_nil
    end
  end

  describe '#push' do
    context 'into an empty Queue' do
      it 'sets both head and tail with the new data' do
        subject.push 1
        expect(subject.head.data).to be 1
        expect(subject.tail.data).to be 1
      end
    end

    context 'into a populated Queue' do
      it 'places the new data at the tail' do
        subject.push 1
        subject.push 2
        expect(subject.head.data).to be 1
        expect(subject.tail.data).to be 2
      end
    end
  end

  describe '#empty?' do
    it 'returns a Boolean True if empty, False if nonempty' do
      expect(subject.empty?).to be true
      subject.push 'something'
      expect(subject.empty?).to be false
    end
  end

  describe '#pop' do
    context 'from an empty queue' do
      it 'returns nil' do
        expect(subject.pop).to be_nil
      end
    end

    context 'from a populated queue' do
      before :each do
        subject.push 1
      end

      context 'with one member' do
        it 'returns the data, and leaves an empty queue' do
          expect(subject.pop).to be 1
          expect(subject.head).to be_nil
          expect(subject.tail).to be_nil
        end
      end

      context 'with multiple members' do
        before :each do
          subject.push 2
        end
        it 'returns the data, and leaves a populated queue' do
          expect(subject.pop).to be 1
          expect(subject.head.data).to be 2
          expect(subject.tail.data).to be 2 
        end
      end
    end
  end
end
