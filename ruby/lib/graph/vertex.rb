module Graph
  class Vertex
    attr_reader :neighbors, :edges, :data

    def initialize(data)
      @data = data
      # start unconnected
      @neighbors, @edges = Set.new, Set.new
      return
    end

    def connect(neighbor, distance=Float::INFINITY)
      unless @neighbors.include? neighbor
        @neighbors << neighbor

        # TODO: does not account for multiple paths between two vertices
        @edges << Edge.new(neighbor, distance)
      end
    end

    class Edge
      def initialize(vertex, distance)
        @vertex, @distance = vertex, distance
      end
    end
  end
end
