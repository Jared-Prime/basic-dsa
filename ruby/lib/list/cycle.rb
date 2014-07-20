require './lib/list/linked'

module List
  class Cycle < Linked

    # The structure defining a node in a circular linked-list is identical
    # to that of a node in a simple linked-list. However, the update and remove 
    # rules are modified to maintain that the tail of the list points back
    # to the head, and we require a new each method to handler iterating through
    # items of the list.
    #
    # Green, Bradley; Brewer, Jason (2013-08-12). Programming Problems in Ruby (Kindle Locations 348-350).  . Kindle Edition. 

    attr_accessor :head

    def initialize(node=nil)
      @head = node
    end

    # detect loops while iterating using the Linked#each
    def each
      prev = nil
      current = @head
      while current
        yield current
        prev    = current
        current = current.next_node
        break if current == @head
      end
    end

    # @Listing 2.8
    def insert(data)
      node = Node.new data

      if @head.nil?
        node.next_node = node
      else
        # the new node will have the same trailing node as old
        node.next_node = @head.next_node
        # the old head will become the tail
        @head.next_node = node
      end

      @head = node
    end

    def remove(data)
      if @head.nil? || @head.next_node == @head
        # there are zero or one nodes, so return and empty list
        @head = nil
      elsif target = find_data(data) # find the node whose data we wish to remove

        # we can only reference `:next_node`,
        # so find the node immediately following our target
        following = target.next_node

        # have our target assume the identity of its follower
        # this enables us to preserve the linkage to the target's previous node
        target.data = following.data
        target.next_node = following.next_node

        # we need to be sure to update the head, otherwise we risk orphaning the list
        @head = target if @head == following
      end
    end
  end
end
