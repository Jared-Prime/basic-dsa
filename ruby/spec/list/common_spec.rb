require './lib/list/node'
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
  let(:node1){ List::Node.new 'Alice', node2 }
  let(:node2){ List::Node.new 'Bob', node3 }
  let(:node3){ List::Node.new 'Carol', node4 }
  let(:node4){ List::Node.new 'Dave', node5 }
  let(:node5){ List::Node.new 'Erin', node6 }
  let(:node6){ List::Node.new 'Frank', node7 }
  let(:node7){ List::Node.new 'Georgette', node8 }
  let(:node8){ List::Node.new 'Hannah', node9 }
  let(:node9){ List::Node.new 'Isaac', node10 }
  let(:node10){ List::Node.new 'Jared', nil }

  describe '#midpoint' do
    it 'returns the middle' do
      expect(subject.midpoint).to be node6
    end
  end
end
