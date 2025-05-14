# frozen_string_literal: true

require 'spec_helper'
require_relative '../../chapter_01_introduction_to_algorithms/simple_search'

RSpec.describe Algorithm do
  describe '.simple_search' do
    it 'returns the index of the target element in the list' do
      expect(described_class.simple_search([1, 2, 3, 4, 5], 3)).to eq(2)
    end

    it 'returns nil if the target element is not in the list' do
      expect(described_class.simple_search([1, 2, 3, 4, 5], 6)).to be_nil
    end

    it 'returns the index of the first occurrence of the target element in the list' do
      expect(described_class.simple_search([1, 2, 3, 2, 5], 2)).to eq(1)
    end

    it 'works with an empty list' do
      expect(described_class.simple_search([], 3)).to be_nil
    end

    it 'works with a list containing one element that matches the target' do
      expect(described_class.simple_search([3], 3)).to eq(0)
    end

    it 'works with a list containing one element that does not match the target' do
      expect(described_class.simple_search([1], 3)).to be_nil
    end
  end
end
