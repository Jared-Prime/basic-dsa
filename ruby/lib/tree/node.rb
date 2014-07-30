module Tree
  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left=nil, right=nil)
      @data, @left, @right = data, left, right
    end
  end
end
