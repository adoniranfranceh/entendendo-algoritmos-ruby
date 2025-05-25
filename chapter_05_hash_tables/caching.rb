# frozen_string_literal: true

module Algorithm
  module Caching
    def self.expensive_computation(input)
      puts "calculating #{input}..."
      input * input
    end

    def self.demo_cache
      cache = {}

      inputs = [2, 3, 2, 4, 3]

      inputs.each do |input|
        if cache.key?(input)
          puts "Cache hit to #{input}, result: #{cache[input]}"
        else
          result = expensive_computation(input)
          cache[input] = result
          puts "Cache miss to #{input}, result stored: #{result}"
        end
      end
    end
  end
end
