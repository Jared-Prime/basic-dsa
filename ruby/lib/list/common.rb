module List
  module Common
    include Enumerable

    attr_accessor :head

    def initialize(node=nil)
      @head = node
    end

    def each
      raise NotImplementedError, 'Write an iterator in your class!'
    end

    # convienience method for extracting the data of the nodes into an Array
    def data
      map(&:data)
    end

    # returns node at index if exists, otherwise returns nil
    def loc(index)
      find.with_index { |node, i| i == index }
    end

    # @Listing 2.5 (see Diagram)
    def find_data(data)
      # rely on Enumerable#find, passing in our own comparison block
      return find{ |node| node.data == data }
    end

    # @Listing 2.16 (see Diagram)
    def midpoint
      current  = @head
      target = @head

      # so long as there is a current and a #next_node
      while current && current = current.next_node
        # move the current one extra step for each step the target moves
        # this way current will always be twice the target, hence the target
        # is half the distance of the current
        current  = current.next_node
        target = target.next_node
      end

      return target
    end

    # @Listing 2.17 (see Diagram)
    def dist_from_end(offset)
      current = @head
      target  = @head

      offset.times { current = current.next_node if current }

      while current && current = current.next_node
        current = current.next_node 
        target  = trailing.next_node
      end
      return target
    end
  end
end
