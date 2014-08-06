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
      expect(subject.root.right_branch).to be_nil
    end

    it 'inserts larger values on the right branch' do
      subject.insert 42
      subject.insert 50
      expect(subject.root.data).to be 42
      expect(subject.root.left_branch).to be_nil
      expect(subject.root.right_branch.data).to be 50
    end
  end

  describe '#remove' do
    before :each do
      subject.insert 42
      subject.insert 5
      subject.insert 50
      subject.insert 49
      subject.insert 20
    end

    it 'relies on search for parent node'
    it 'relies on search for successor node'
  end

  describe '#find_parent' do
    before :each do
      subject.insert 42
      subject.insert 5
      subject.insert 50
      subject.insert 49
      subject.insert 20
    end

    it 'returns the parent node' do
      expect(subject.find_parent(42)).to be_nil
      expect(subject.find_parent(5).data).to be 42
      expect(subject.find_parent(50).data).to be 42
      expect(subject.find_parent(49).data).to be 50
      expect(subject.find_parent(20).data).to be 5
    end
  end

  describe '#find_successor'

  describe '#find' do
    before :each do
      subject.insert 42
      subject.insert 5
      subject.insert 50
      subject.insert 49
      subject.insert 20
    end

    it 'recursively walks the tree to find the node' do
      expect(subject.find(42)).to be_a Tree::Node
      expect(subject.find(5)).to  be_a Tree::Node
      expect(subject.find(50)).to be_a Tree::Node
      expect(subject.find(49)).to be_a Tree::Node
      expect(subject.find(20)).to be_a Tree::Node
      expect(subject.find(11)).to be_nil
    end
  end

  describe '#balanced?'
end
