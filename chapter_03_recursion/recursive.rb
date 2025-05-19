# frozen_string_literal: true

module Algorithm
  module Recursion
    def self.find_key(boxes, key)
      boxes.each do |item|
        if item.is_a?(Array)
          found = find_key(item, key)
          return true if found
        elsif item == key
          return true
        end
      end

      false
    end

    def self.factorial(natural_number)
      return 1 if natural_number.zero?

      natural_number * factorial(natural_number - 1)
    end

    def self.recursive_sum(arr)
      return 0 if arr.empty?

      arr[0] + recursive_sum(arr[1..])
    end
  end
end
