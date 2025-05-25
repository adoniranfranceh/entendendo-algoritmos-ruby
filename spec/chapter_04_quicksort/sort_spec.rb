# frozen_string_literal: true

require 'rspec'
require_relative '../../chapter_04_quicksort/sort'

RSpec.describe Algorithm::Sort do
  describe '.quicksort' do
    it 'sorts an empty array' do
      expect(described_class.quicksort([])).to eq([])
    end

    it 'sorts an array with one element' do
      expect(described_class.quicksort([1])).to eq([1])
    end

    it 'sorts an already sorted array' do
      expect(described_class.quicksort([1, 2, 3, 4, 5])).to eq([1, 2, 3, 4, 5])
    end

    it 'sorts a reverse sorted array' do
      expect(described_class.quicksort([5, 4, 3, 2, 1])).to eq([1, 2, 3, 4, 5])
    end

    it 'sorts an array with duplicate elements' do
      expect(described_class.quicksort([3, 1, 2, 3, 1])).to eq([1, 1, 2, 3, 3])
    end

    it 'sorts an array with negative numbers' do
      expect(described_class.quicksort([0, -1, 3, -2, 2])).to eq([-2, -1, 0, 2, 3])
    end
  end

  describe '.merge_sort' do
    it 'sorts an empty array' do
      expect(described_class.merge_sort([])).to eq([])
    end

    it 'sorts an array with one element' do
      expect(described_class.merge_sort([42])).to eq([42])
    end

    it 'sorts an already sorted array' do
      expect(described_class.merge_sort([1, 2, 3, 4, 5])).to eq([1, 2, 3, 4, 5])
    end

    it 'sorts a reverse sorted array' do
      expect(described_class.merge_sort([5, 4, 3, 2, 1])).to eq([1, 2, 3, 4, 5])
    end

    it 'sorts an array with duplicate elements' do
      expect(described_class.merge_sort([2, 1, 2, 1, 3])).to eq([1, 1, 2, 2, 3])
    end

    it 'sorts an array with negative numbers' do
      expect(described_class.merge_sort([0, -3, 2, -1, 1])).to eq([-3, -1, 0, 1, 2])
    end
  end

  describe '.merge' do
    it 'merges two sorted arrays' do
      expect(described_class.merge([1, 3, 5], [2, 4, 6])).to eq([1, 2, 3, 4, 5, 6])
    end

    it 'merges when one array is empty' do
      expect(described_class.merge([], [1, 2, 3])).to eq([1, 2, 3])
      expect(described_class.merge([1, 2, 3], [])).to eq([1, 2, 3])
    end

    it 'merges arrays with duplicate elements' do
      expect(described_class.merge([1, 2, 2], [2, 3])).to eq([1, 2, 2, 2, 3])
    end
  end
end
