# frozen_string_literal: true

module Algorithm
  module Sort
    def self.selection_sort(array)
      sorted = []

      until array.empty?
        smallets_index = find_smallest_index(array)
        sorted << array.delete_at(smallets_index)
      end

      sorted
    end

    def self.find_smallest_index(array)
      smallest = array[0]
      smallest_index = 0

      array.each_with_index do |item, index|
        if item < smallest
          smallest = item
          smallest_index = index
        end
      end

      smallest_index
    end
  end
end
