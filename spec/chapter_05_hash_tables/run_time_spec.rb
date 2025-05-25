# frozen_string_literal: true

require 'spec_helper'
require_relative '../../chapter_05_hash_tables/index'

RSpec.describe Chapter05::HashTable do
  describe '.collect_results' do
    it 'returns an array with results for each algorithm' do
      results = described_class.collect_results

      expect(results.size).to eq(4)
      results.each do |res|
        expect(res).to include(:algorithm, :time)
        expect(res[:algorithm]).to be_a(String)
        expect(res[:time]).to be_a(Float)
      end
    end
  end

  describe '.print_results' do
    it 'prints formatted results' do
      results = [
        { algorithm: 'Alg 1', time: 0.1 },
        { algorithm: 'Alg 2', time: 0.2 }
      ]

      output = capture_stdout do
        described_class.print_results(results)
      end

      expect(output).to include('Results:')
      expect(output).to include('- Alg 1: time=')
      expect(output).to include('- Alg 2: time=')
    end
  end

  def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = StringIO.new
    block.call
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end
