# frozen_string_literal: true

require_relative 'simple_search'
require_relative 'binary_search'
require_relative '../exec_time'

include Algorithm
include ExecTime

list = (0...100_000_000).to_a.sort
value = 99_999

result_index = []
result_index << ExecTime.measure('Simple Search') { Algorithm.simple_search(list, value) }
result_index << ExecTime.measure('Binary Search') { Algorithm.binary_search(list, value) }

puts "Include value? #{list.include?(value)}"
puts "It is ordered? #{list == list.sort}"
puts 'Results:'
puts "List of #{list[0]} to #{list[-1]}"
result_index.each do |r|
  puts " - #{r[:algorithm]}: index=#{r[:result]}, time=#{r[:time]}s"
end
