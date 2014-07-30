require './lib/list/linked'

module Stack
  class Stack
    attr_reader :contents

    def initialize
      @contents = List::Linked.new
    end

    def push(data)
      @contents.insert(data)
    end

    def head
      @contents.head
    end
    alias_method :peek, :head

    def empty?
      head == nil
    end
  end
end
