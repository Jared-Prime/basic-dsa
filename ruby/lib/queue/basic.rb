module Queue
  class Queue
    attr_reader :head, :tail

    def initialize
      @head, @tail = nil, nil
    end

    def push(data)
      node = Node.new(data)
      if @tail
        @tail = @tail.next = node
      else
        @head = @tail = node
      end
    end
  end
end
