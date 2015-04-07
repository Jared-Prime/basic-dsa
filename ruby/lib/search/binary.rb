module Search
  module Binary
    class << self
      def search(array, target)
        l, u = 0, array.size - 1

        while l < u
          mid = (u - l) / 2

          return mid if target == array[mid]

          if target < array[mid]
            u = mid
          else
            l = mid
          end
        end
      end
    end
  end
end
