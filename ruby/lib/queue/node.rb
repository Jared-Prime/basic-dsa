module Queue
  class Node
    attr_accessor :data, :next_node

    def initialize(data, next_node=nil)
      @data, @next_node = data, next_node
    end

  end
end
