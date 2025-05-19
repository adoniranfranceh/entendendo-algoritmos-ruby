# frozen_string_literal: true

require 'rspec'
require_relative '../../../chapter_03_recursion/iterative/recursion_iterative'

RSpec.describe Algorithm::Iterative do
  describe '.find_key' do
    it 'returns true when the key is found in the boxes' do
      boxes = [1, [2, 3, [4, 5, 'key']]]
      expect(described_class.find_key(boxes, 'key')).to eq(true)
    end

    it 'returns false when the key is not found in the boxes' do
      boxes = [1, [2, 3, [4, 5]]]
      expect(described_class.find_key(boxes, 'key')).to eq(false)
    end

    it 'handles empty boxes' do
      boxes = []
      expect(described_class.find_key(boxes, 'key')).to eq(false)
    end
  end

  describe '.factorial' do
    it 'returns 1 for factorial of 0' do
      expect(described_class.factorial(0)).to eq(1)
    end

    it 'returns 1 for factorial of 1' do
      expect(described_class.factorial(1)).to eq(1)
    end

    it 'returns the correct factorial for a positive number' do
      expect(described_class.factorial(5)).to eq(120)
    end
  end

  describe '.recursive_sum' do
    it 'returns 0 for an empty array' do
      expect(described_class.recursive_sum([])).to eq(0)
    end

    it 'returns the sum of all elements in the array' do
      expect(described_class.recursive_sum([1, 2, 3, 4, 5])).to eq(15)
    end

    it 'handles arrays with negative numbers' do
      expect(described_class.recursive_sum([-1, -2, -3, 4, 5])).to eq(3)
    end
  end
end
