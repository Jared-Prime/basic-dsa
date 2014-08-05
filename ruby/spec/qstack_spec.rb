require './lib/qstack'

describe QStack do
  subject{ QStack.new }

  describe '.initialize' do
    it 'creates two empty internal Queues' do
      expect(subject.primary).to be_a Queue
      expect(subject.secondary).to be_a Queue
    end
  end

  describe '#push' do
    context 'when empty' do
      it 'pushes into the secondary' do
        subject.push 'first'
        expect(subject.primary.head.data).to eq 'first'
      end
    end

    context 'when populated' do
      before :each do
        subject.push 'first'
      end
      it 'pushes into the primary' do
        subject.push 'last'
        expect(subject.primary.head.data).to eq 'last'
      end
    end
  end

  describe '#pop' do
    before :each do
      subject.push 'first'
      subject.push 'last'
    end
    it 'removes the last inserted data' do
      expect(subject.pop).to eq 'last'
      expect(subject.pop).to eq 'first'
    end
  end
end
