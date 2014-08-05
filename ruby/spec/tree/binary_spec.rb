require './lib/tree/binary'

describe Tree::Binary do
  subject{ described_class.new }

  describe '.initialize' do
    it 'starts with an empty root' do
      expect(subject.root).to be_nil
    end
  end

  describe '#insert' do
    context 'into an empty tree' do
      it 'creates a new root' do
        subject.insert 42
        expect(subject.root.data).to be 42
      end
    end

    it 'inserts smaller values on the left branch' do
      subject.insert 42
      subject.insert 5
      expect(subject.root.data).to be 42
      expect(subject.root.left_branch.data).to be 5
    end
  end

  describe '#remove'

  describe '#find'

  describe '#balanced?'
end
