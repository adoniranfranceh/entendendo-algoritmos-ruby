# frozen_string_literal: true

require 'spec_helper'
require_relative '../../run_time'

RSpec.describe RunTime do
  describe '.measure' do
    it 'measures the execution time of a simple block' do
      result = RunTime.measure('simple addition') { 1 + 1 }
      expect(result[:algorithm]).to eq('simple addition')
      expect(result[:result]).to eq(2)
      expect(result[:time]).to be_a(Float)
    end

    it 'measures the execution time of a more complex block' do
      result = RunTime.measure('array sum') { (1..1000).to_a.sum }
      expect(result[:algorithm]).to eq('array sum')
      expect(result[:result]).to eq(500_500)
      expect(result[:time]).to be_a(Float)
    end

    it 'handles empty blocks gracefully' do
      result = RunTime.measure('empty block') {}
      expect(result[:algorithm]).to eq('empty block')
      expect(result[:result]).to be_nil
      expect(result[:time]).to be_a(Float)
    end
  end
end
