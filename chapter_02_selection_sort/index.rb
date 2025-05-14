# frozen_string_literal: true

require_relative 'selection_sort'
require_relative '../run_time'

module Chapter02
  class SelectionSort
    include Algorithm::Sort
    include RunTime

    def self.run
      list = [5, 1, 3, 10, 7, 0, -2, 79]

      result_index = []
      result_index << RunTime.measure('Selection Sort') { Algorithm::Sort.selection_sort(list) }

      puts "It is ordered? #{list == list.sort}"
      puts 'Results:'
      puts "List of #{list[0]} to #{list[-1]}"
      result_index.each do |r|
        puts " - #{r[:algorithm]}: index=#{r[:result]}, time=#{r[:time]}s"
      end
    end
  end
end

Chapter02::SelectionSort.run
