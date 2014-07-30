require './lib/list/common'

describe List::Common do
  subject do
    class BasicList
      include List::Common
      def each
        current = @head
        while current
          yield current
          current = current.next_node
        end
      end
    end
    BasicList.new node1
  end
  let(:node1){ Node.new 'Alice', node2 }
  let(:node2){ Node.new 'Bob', node3 }
  let(:node3){ Node.new 'Carol', node4 }
  let(:node4){ Node.new 'Dave', node5 }
  let(:node5){ Node.new 'Erin', node6 }
  let(:node6){ Node.new 'Frank', node7 }
  let(:node7){ Node.new 'Georgette', node8 }
  let(:node8){ Node.new 'Hannah', node9 }
  let(:node9){ Node.new 'Isaac', node10 }
  let(:node10){ Node.new 'Jared', nil }

  describe '#midpoint' do
    it 'returns the middle' do
      expect(subject.midpoint).to be node6
    end
  end
end
