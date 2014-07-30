require './lib/node'

class Queue
  attr_reader :head, :tail

  def initialize
    @head, @tail = nil, nil
  end

  def push(data)
    node = Node.new(data)
    if empty?
      @head = @tail = node
    else
      @tail = @tail.next_node = node
    end
  end

  def pop
    return nil if empty?

    data  = @head.data
    @head = @head.next_node
    @tail = nil if empty?
    return data
  end

  def empty?
    @head == nil
  end
end
