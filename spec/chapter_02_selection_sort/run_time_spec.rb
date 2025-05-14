# frozen_string_literal: true

require 'rspec'
require_relative '../../run_time'

RSpec.describe RunTime do
  describe '.measure' do
    it 'measures the execution time of a block and returns the result' do
      result = RunTime.measure('simple addition') do
        2 + 2
      end

      expect(result[:algorithm]).to eq('simple addition')
      expect(result[:result]).to eq(4)
      expect(result[:time]).to be_a(Float)
    end

    it 'measures the execution time of a selection sort algorithm' do
      selection_sort = lambda do |array|
      n = array.length

      (0...n - 1).each do |i|
        min_index = i

        (i + 1...n).each do |j|
        min_index = j if array[j] < array[min_index]
        end

        if min_index != i
        array[i], array[min_index] = array[min_index], array[i]
        end
      end

      array
      end

      result = RunTime.measure('selection sort') do
      selection_sort.call([5, 3, 6, 2, 10])
      end

      expect(result[:algorithm]).to eq('selection sort')
      expect(result[:result]).to eq([2, 3, 5, 6, 10])
      expect(result[:time]).to be_a(Float)
    end
  end
end