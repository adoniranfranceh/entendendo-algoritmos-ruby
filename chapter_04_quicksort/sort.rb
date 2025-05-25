# frozen_string_literal: true

module Algorithm
  module Sort
    def self.quicksort(array)
      return array if array.size <= 1

      pivot = array[array.size / 2]
      left = array.select { |x| x < pivot }
      middle = array.select { |x| x == pivot }
      right = array.select { |x| x > pivot }

      quicksort(left) + middle + quicksort(right)
    end

    def self.merge_sort(array)
      return array if array.size <= 1

      mid = array.size / 2
      left = merge_sort(array[0...mid])
      right = merge_sort(array[mid..])

      merge(left, right)
    end

    def self.merge(left, right)
      result = []
      result << (left.first <= right.first ? left.shift : right.shift) until left.empty? || right.empty?
      result + left + right
    end
  end
end
