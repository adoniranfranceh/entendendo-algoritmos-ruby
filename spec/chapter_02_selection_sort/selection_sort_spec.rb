# frozen_string_literal: true

require 'spec_helper'
require_relative '../../chapter_02_selection_sort/selection_sort'

RSpec.describe Algorithm::Sort do
  describe '.selection_sort' do
    it 'sorts an array of integers in ascending order' do
      expect(described_class.selection_sort([5, 3, 6, 2, 10])).to eq([2, 3, 5, 6, 10])
    end

    it 'returns an empty array when given an empty array' do
      expect(described_class.selection_sort([])).to eq([])
    end

    it 'returns the same array when given a single-element array' do
      expect(described_class.selection_sort([42])).to eq([42])
    end

    it 'sorts an array with duplicate elements' do
      expect(described_class.selection_sort([4, 2, 4, 3, 2])).to eq([2, 2, 3, 4, 4])
    end

    it 'sorts an already sorted array' do
      expect(described_class.selection_sort([1, 2, 3, 4, 5])).to eq([1, 2, 3, 4, 5])
    end

    it 'sorts an array in descending order' do
      expect(described_class.selection_sort([10, 9, 8, 7, 6])).to eq([6, 7, 8, 9, 10])
    end

    it 'sorts an array with negative numbers' do
      expect(described_class.selection_sort([-3, -1, -7, -2, -5])).to eq([-7, -5, -3, -2, -1])
    end

    it 'sorts an array with both positive and negative numbers' do
      expect(described_class.selection_sort([3, -1, 0, -2, 5])).to eq([-2, -1, 0, 3, 5])
    end
  end
end