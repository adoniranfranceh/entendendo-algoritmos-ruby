# frozen_string_literal: true

require_relative 'sort'
require_relative '../run_time'

module Chapter04
  class Quicksort
    include Algorithm::Sorting
    include RunTime

    def self.run
      list = [5, 1, 3, 10, 7, 0, -2, 79]

      result_index = []
      result_index << RunTime.measure('Quicksort') { Algorithm::Sorting.quicksort(list) }
      result_index << RunTime.measure('Merge Sort') { Algorithm::Sorting.quicksort(list) }

      logs(list, 5)
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

Chapter04::Quicksort.run
