# frozen_string_literal: true

require 'rspec'
require_relative '../../chapter_05_hash_tables/caching'

RSpec.describe Algorithm::Caching do
  describe '.expensive_computation' do
    it 'returns the square of the input' do
      expect(described_class.expensive_computation(3)).to eq(9)
      expect(described_class.expensive_computation(5)).to eq(25)
    end

    it 'prints calculating message' do
      expect do
        described_class.expensive_computation(2)
      end.to output(/calculating 2\.\.\./).to_stdout
    end
  end

  describe '.demo_cache' do
    it 'caches results and prints cache hits and misses' do
      expect do
        described_class.demo_cache
      end.to output(
        /
          calculating\ 2\.\.\.\n
          Cache\ miss\ to\ 2,\ result\ stored:\ 4\n
          calculating\ 3\.\.\.\n
          Cache\ miss\ to\ 3,\ result\ stored:\ 9\n
          Cache\ hit\ to\ 2,\ result:\ 4\n
          calculating\ 4\.\.\.\n
          Cache\ miss\ to\ 4,\ result\ stored:\ 16\n
          Cache\ hit\ to\ 3,\ result:\ 9\n
        /x
      ).to_stdout
    end

    it 'does not recalculate cached values' do
      cache = {}
      allow(described_class).to receive(:expensive_computation).and_wrap_original do |m, x|
        cache[x] ||= m.call(x)
      end

      described_class.demo_cache
      expect(described_class).to have_received(:expensive_computation).exactly(3).times
    end
  end
end
