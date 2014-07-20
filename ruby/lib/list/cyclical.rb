module List
  module Cyclical
    # detect loops while iterating using the Enumerable#each
    # (see Diagram)
    def each
      prev = nil # we will need to keep track of the previous node
      current = @head
      while current
        yield current
        
        # we've done work on this node. it's now assigned as prev
        prev    = current 
        
        # same as before...
        current = current.next_node 

        # if we're about to consider the head again,
        # we've done n steps and must stop
        break if current == @head 
      end
    end

    def tail
      @tail ||= find do |node|
        node.next_node == @head
      end
    end

    private

    def single_node?
      @head && @head == @head.next_node
    end
  end
end
