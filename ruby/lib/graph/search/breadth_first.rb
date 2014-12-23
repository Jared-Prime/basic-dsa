require './lib/queue'

module Graph
  module Search
    module BreadthFirst
      class << self
        def run(root_vertex, target_data)
          frontier = Queue.new
          explored = Set.new

          frontier.push root_vertex

          loop do
            yield if block_given?

            return nil if frontier.empty?

            current = frontier.pop
            return current if current.data == target_data

            current.neighbors.each do |neighbor|
              frontier.push neighbor unless explored.include? neighbor
            end
          end
        end
      end
    end
  end
end
