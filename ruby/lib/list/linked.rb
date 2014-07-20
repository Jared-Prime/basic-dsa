module List
  class Linked
    include Enumerable

    attr_accessor :head

    # @Listing 2.2
    def each
      current = @head
      while current
        yield current
        current = current.next_node
      end
    end

    def data
      map(&:data)
    end

    # @Listing 2.3
    def insert(data)
      @head = Node.new(data, @head)
    end

    # @Listing 2.4
    def sorted_insert(data)
      # simply insert if the list is empty or the data is the lowest value
      return insert(data) if !@head || data <= @head.data

      # start at the beginning of the list
      current = @head

      # compare in sequence each node's data with the data to be inserted
      while current.next_node && current.next_node.data < data
        current = current.next_node
      end

      # when we break, create a new node with our data
      # the next node from our newly created node is whichever came *after*
      # the breakpoint. The breakpoint's next node is the new node
      current.next_node = Node.new(data, current.next_node)
    end

    # @Listing 2.5
    def find_data(data)
      # rely on Enumerable#find, passing in our own comparison block
      return find{ |node| node.data == data }
    end

    # @Listing 2.6
    def remove(data)
      if @head.data == data
        @head = @head.next_node
        return
      end

      prev = find do |node|
        node.next_node.data == data if node.next_node
      end

      if prev
        target = prev.next_node
        prev.next_node = target.next_node
      end
    end
  end
end
