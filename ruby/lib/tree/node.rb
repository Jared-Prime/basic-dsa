module Tree
  class Node
    attr_accessor :data, :left_branch, :right_branch

    def initialize(data, left_branch=nil, right_branch=nil)
      @data, @left_branch, @right_branch = data, left_branch, right_branch
    end
  end
end
