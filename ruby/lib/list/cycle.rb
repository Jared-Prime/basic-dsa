require './lib/list/common'
require './lib/list/cyclical'

module List
  class Cycle
    include Cyclical

    # The structure defining a node in a circular linked-list is identical
    # to that of a node in a simple linked-list. However, the update and remove 
    # rules are modified to maintain that the tail of the list points back
    # to the head, and we require a new each method to handler iterating through
    # items of the list.
    #
    # Green, Bradley; Brewer, Jason (2013-08-12). 
    # Programming Problems in Ruby (Kindle Locations 348-350).  . Kindle Edition. 

    # @Listing 2.8 (see Diagram)
    # differs in that we need to update the tail's #next_node
    # due to the fact that the head has changed. this extra work occurs in the 
    # `else` block below
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

    # @Listing 2.10 (see Diagram)
    # just as in the #insert method we had to ensure the tail was properly updated
    # we have to make similar adjustments here
    def remove(data)
      # If there's only 1 node, and it has the data, return an empty list 
      if single_node? && @head.data == data
        @head = nil
        return
      end

      prev = find do |node|
        # there will always be a next node, so unlike in List::Linked
        # we do *not* need to gaurd against #next_node returning `nil`
        node.next_node.data == data
      end

      if prev
        # we have found the node prevous to our target, and therefore our target
        target = prev.next_node

        # we also need to consider the follower of the target. this saves us in
        # the case where we're removing the tail, which maintains a reference to
        # the head
        follower = target.next_node

        # as in List::Linked, simply exclude the target from the list
        # by removing its reference from its previous
        prev.next_node = follower

        # now we need to be certain to update the head
        @head = follower if target == @head
      end
    end
  end
end
