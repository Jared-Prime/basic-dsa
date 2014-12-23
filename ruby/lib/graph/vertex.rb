module Graph
  class Vertex
    attr_reader :neighbors, :data

    def initialize(data)
      @data = data
      # start unconnected
      @neighbors = Set.new
      return
    end

    def connect(neighbor)
      # TODO: could add some type checking here
      @neighbors << neighbor unless @neighbors.include? neighbor
    end
  end
end
