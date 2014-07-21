require './lib/list/common'
require './lib/list/cyclical'

module List
  class Doubled 
    include Cyclical

    # @Listing 2.12
    #
    def insert(data)
      node = Node.new data

      if @head.nil?
        # the new node will be its own trailing node
        node.next_node = node
        node.prev_node = node
      else
        # new node takes on position of new head
        node.next_node = @head
        node.prev_node = @head.prev_node

        # update the tail
        @head.prev_node.next_node = node

        # update the head
        @head.prev_node = node
      end

      # make new node the head
      @head = node
    end

    # @Listing 2.14
    def remove(data)
      # same check as in List::Cycle
      if single_node? && @head.data == data
        @head = nil
        return
      end

      # this is actually easier than in List::Cycle. the fact that we can
      # call #prev_node on the target means we can just use Base#find_data
      # and then 'swap' around the target node
      if target = find_data(data)
        target.prev_node.next_node = target.next_node
        target.next_node.prev_node = target.prev_node

        @head = target.next_node if @head == target
      end
    end
  end
end
