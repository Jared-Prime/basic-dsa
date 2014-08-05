require './lib/node'

class Stack
  attr_accessor :top

  def initialize
    @top = nil
  end

  def push(data)
    node = Node.new data
    node.next_node = @top
    @top = node
  end

  def pop
    return if empty?
    data = @top.data
    @top = @top.next_node
    return data
  end

  def empty?
    @top == nil
  end
end
