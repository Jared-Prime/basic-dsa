module Graph
  class Connected
    attr_reader :vertices

    class << self
      # [[vertex_a, vertex_b, cost]]
      def generate(matrix)
        vertices = Set.new

        matrix.each do |vector|
          vertices << vector[0].connect(vector[1], vector[2])
        end

        Graph::Connected.new vertices
      end
    end

    def initialize(vertices)
      @vertices = vertices
    end
  end
end
