require './lib/tree/node'

module Tree
  class Binary
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(data)
      @root = create_node(@root, data)
    end

    def find(data)
      find_node(@root, data)
    end

    def remove(data)
      # search is required to find the next value in the binary search tree 
      # that is compatible with the position of the node being removed. 
      # When this is found, that value is replaced and the node found is removed.

      # Green, Bradley; Brewer, Jason (2013-08-12).
      # Programming Problems in Ruby (Kindle Locations 842-843). 
    end

    def find_parent(data)
      return nil if @root.data == data
      find_parent_node(@root, data)
    end

    def find_successor(data)
      # The successor of a target node is a node in a binary search binary tree
      # whose data would immediately follow the target node’s data in
      # a sorted list of all the data members associated with the binary tree.

      # Green, Bradley; Brewer, Jason (2013-08-12). 
      # Programming Problems in Ruby (Kindle Locations 866-868). 
      target = find(data)

      return nil unless target
      return find_successor_on_right(target) || find_successor_on_left(target)
    end

    private

    def find_successor_on_right(target)
      if successor = target.right_branch
        while successor.left_branch
          successor = successor.left_branch
        end
        return successor
      end
    end

    def find_successor_on_left(target)
      successor = nil
      begin
        target = successor if successor
        successor = find_parent target.data
      end while successor && successor.right_branch == target
      return successor
    end

    def find_parent_node(node, data)
      if node.left_branch && data == node.left_branch.data
        return node
      elsif node.right_branch && data == node.right_branch.data
        return node
      elsif data < node.data
        return find_parent_node(node.left_branch, data)
      elsif data >= node.data
        return find_parent_node(node.right_branch, data)
      else
        return nil
      end
    end

    def find_node(node, data)
      return node if !node || node.data == data

      if data < node.data
        return find_node node.left_branch, data
      else
        return find_node node.right_branch, data
      end
    end

    def create_node(node, data)
      return Node.new(data) unless node

      if data < node.data
        node.left_branch  = create_node(node.left_branch, data)
      else
        node.right_branch = create_node(node.right_branch, data)
      end

      return node
    end
  end
end
