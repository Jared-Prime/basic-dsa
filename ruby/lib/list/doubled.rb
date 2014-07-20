require './lib/list/cycle'

module List
  class Doubled < Cycle

    def initialize(node=nil)
      @head = node
    end

    def insert(data)
      node = Node.new data

      if @head.nil?
        # the new node will be its own trailing node
        node.next_node = node
        node.prev_node = node
      else
        node.next_node = @head.next_node
       
        # the old head will become the tail
        @head.next_node = node

        node.prev_node = @head
      end

      @head = node
    end
  end
end
