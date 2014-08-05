require './lib/squeue'

describe SQueue do
  subject{ described_class.new }
  
  describe '.initialize' do
    it 'creates two empty internal stacks' do
      expect(subject.primary).to be_a Stack
      expect(subject.secondary).to be_a Stack
    end
  end

  describe '#push' do
    context 'when empty' do
      specify do
        subject.push 'first'
        expect(subject.primary.top.data).to eq 'first'
      end
    end

    context 'when populated' do
      specify do
        subject.push 'first'
        subject.push 'last'
        expect(subject.primary.top.data).to eq 'last'
      end
    end
  end

  describe '#pop' do
    before :each do
      subject.push 'first'
      subject.push 'last'
    end

    specify do
      expect(subject.pop).to eq 'first'
      expect(subject.pop).to eq 'last'
    end
  end
end
