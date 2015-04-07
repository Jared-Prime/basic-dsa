require './lib/search/binary'

describe Search::Binary do
  subject { described_class }
  let(:array){ [1,2,3] }

  # # First Pass
  # l -> 0
  # u -> 2
  # mid -> 1
  # array[mid] -> 2
  # # Second Pass
  # l -> 0
  # u -> 2
  # mid -> 1
  # array[mid] -> 2
  describe '.search' do
    specify do
      expect(subject.search(array, 1)).to be 0
      expect(subject.search(array, 2)).to be 1
      expect(subject.search(array, 3)).to be 2
    end
  end
end
