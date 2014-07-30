require './lib/tree/binary'

describe Tree::Binary do
  subject{ described_class.new }

  describe '.initialize' do
    it 'starts with an empty root' do
      expect(subject.root).to be_nil
    end
  end
end
