require './lib/list'

module List
  class Linked
    include Base

    # @Listing 2.2
    # use Enumerable#each to traverse the nodes in series
    def each
      current = @head
      while current
        yield current
        current = current.next_node
      end
    end

    # @Listing 2.3 (see Diagram)
    # new data occupies a new node at the head
    # the head previous to insertion is the next node
    def insert(data)
      @head = Node.new(data, @head)
    end

    # @Listing 2.4 (see Diagram)
    # a sorted insertion requires that we traverse the list in order to
    # create a new node at the appropriate location.
    def sorted_insert(data)
      # simply insert if the list is empty or the data is the lowest value
      return insert(data) if !@head || data <= @head.data

      # start at the beginning of the list
      current = @head

      # if there is a next node and if the next node should come before our data
      # move another place down the list
      while current.next_node && current.next_node.data < data
        current = current.next_node # the tail will have #next_node return nil
      end

      # after exiting the above loop, we know our data should go between
      # the current node and its follower. this means the new node is the follower
      # of the current, and its follower is current's former follower
      current.next_node = Node.new(data, current.next_node)
    end

    # @Listing 2.6 (see Diagram)
    # we will ultimately need 1 < m < n steps to find the data, then one step to
    # remove the data. 
    def remove(data)
      # when head matches the data, return its follower. If the follower is nil,
      # this would simply be an empty list
      if @head.data == data
        @head = @head.next_node
        return
      end

      # this differs significatinly from #find_data above. First, we want our use
      # of Enumerable#find to return the node *previous* to our target. Since each
      # node knows its follower, but not its previous, we call #next_node on the node
      # under consideration before comparing its data. Secondly, for runtime safety,
      # we make sure that there is a next node
      prev = find do |node|
        node.next_node.data == data if node.next_node
      end

      if prev
        # we have found the node prevous to our target, and therefore our target
        target = prev.next_node

        # simply exclude the target from the list by removing its reference from
        # its previous
        prev.next_node = target.next_node
      end
    end
  end
end
