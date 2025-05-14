# frozen_string_literal: true

require 'spec_helper'
require_relative '../../run_time'

RSpec.describe RunTime do
  describe '.measure' do
    it 'measures the Runution time of a simple block' do
      result = described_class.measure('Simple addition') { 1 + 1 }
      expect(result[:algorithm]).to eq('Simple addition')
      expect(result[:result]).to eq(2)
      expect(result[:time]).to be_a(Float)
    end

    it 'measures the Runution time of a more complex block' do
      result = described_class.measure('Array sum') { (1..10_000).to_a.sum }
      expect(result[:algorithm]).to eq('Array sum')
      expect(result[:result]).to eq(50_005_000)
      expect(result[:time]).to be_a(Float)
    end

    it 'handles empty blocks' do
      result = described_class.measure('Empty block') {}
      expect(result[:algorithm]).to eq('Empty block')
      expect(result[:result]).to be_nil
      expect(result[:time]).to be_a(Float)
    end
  end
end
