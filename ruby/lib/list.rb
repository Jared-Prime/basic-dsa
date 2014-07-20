module List
  module Base
    include Enumerable

    attr_accessor :head

    def initialize(node=nil)
      @head = node
    end

    # convienience method for extracting the data of the nodes into an Array
    def data
      map(&:data)
    end

    # @Listing 2.5
    def find_data(data)
      # rely on Enumerable#find, passing in our own comparison block
      return find{ |node| node.data == data }
    end
  end
end
