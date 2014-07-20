require './lib/list'
require './lib/list/cyclical'

module List
  class Doubled 
    include Base
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
        node.next_node = @head.next_node
        # the old head will become the tail
        @head.next_node = node

        node.prev_node = @head
      end

      @head = node
    end
  end
end
