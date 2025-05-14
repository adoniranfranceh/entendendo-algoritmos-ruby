# frozen_string_literal: true

require_relative 'simple_search'
require_relative 'binary_search'
require_relative '../run_time'

module Chapter01
  class IntroductionToAlgorithms
    include Algorithm
    include RunTime

    def self.run
      list = (0...100_000_000).to_a.sort
      value = 99_999

      result_index = []
      result_index << RunTime.measure('Simple Search') { Algorithm.simple_search(list, value) }
      result_index << RunTime.measure('Binary Search') { Algorithm.binary_search(list, value) }

      logs(list, value)
      result_index.each do |r|
        puts " - #{r[:algorithm]}: index=#{r[:result]}, time=#{r[:time]}s"
      end
    end

    def self.logs(list, value)
      puts "Include value? #{list.include?(value)}"
      puts "It is ordered? #{list == list.sort}"
      puts 'Results:'
      puts "List of #{list[0]} to #{list[-1]}"
    end
  end
end

Chapter01::IntroductionToAlgorithms.run
