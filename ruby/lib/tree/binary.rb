require './lib/tree/node'

module Tree
  class Binary
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(data)
      node = Node.new data
      @root = node unless @root
    end
  end
end
