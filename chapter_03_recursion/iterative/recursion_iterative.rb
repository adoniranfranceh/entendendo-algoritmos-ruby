# frozen_string_literal: true

module Algorithm
  module Iterative
    def self.find_key(boxes, key)
      stack = boxes.dup

      until stack.empty?
        item = stack.pop

        stack.concat(item) if item.is_a?(Array)
        return true if item == key
      end

      false
    end

    def self.factorial(natural_number)
      factorial_result = 1
      (1..natural_number).each do |i|
        factorial_result *= i
      end
      factorial_result
    end

    def self.recursive_sum(arr)
      sum = 0
      arr.each { |num| sum += num }
      sum
    end
  end
end
