# frozen_string_literal: true

require 'spec_helper'
require_relative '../../chapter_01_introduction_to_algorithms/binary_search'

RSpec.describe Algorithm do
  describe '.binary_search' do
    it 'returns the index of the target when it is in the list' do
      list = [1, 3, 5, 7, 9]
      target = 5
      expect(described_class.binary_search(list, target)).to eq(2)
    end

    it 'returns nil when the target is not in the list' do
      list = [1, 3, 5, 7, 9]
      target = 4
      expect(described_class.binary_search(list, target)).to be_nil
    end

    it 'returns the index of the target when it is the first element' do
      list = [1, 3, 5, 7, 9]
      target = 1
      expect(described_class.binary_search(list, target)).to eq(0)
    end

    it 'returns the index of the target when it is the last element' do
      list = [1, 3, 5, 7, 9]
      target = 9
      expect(described_class.binary_search(list, target)).to eq(4)
    end

    it 'returns nil for an empty list' do
      list = []
      target = 5
      expect(described_class.binary_search(list, target)).to be_nil
    end

    it 'returns the index of the target in a single-element list' do
      list = [5]
      target = 5
      expect(described_class.binary_search(list, target)).to eq(0)
    end

    it 'returns nil when the target is not in a single-element list' do
      list = [3]
      target = 5
      expect(described_class.binary_search(list, target)).to be_nil
    end
  end
end
