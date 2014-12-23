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
            break if frontier.empty?

            current = frontier.pop

            yield current if block_given?
            return current if current.data == target_data

            current.neighbors.each do |neighbor|
              frontier.push neighbor unless explored.include? neighbor
            end
          end

          raise 'Not in graph'
        end
      end
    end
  end
end
