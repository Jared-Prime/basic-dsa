class Node
  attr_accessor :data, :next_node, :prev_node

  def initialize(data, next_node=nil, prev_node=nil)
    @data, @next_node, @prev_node = data, next_node, prev_node
  end
end
