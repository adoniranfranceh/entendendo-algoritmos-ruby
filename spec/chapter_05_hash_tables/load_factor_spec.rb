# frozen_string_literal: true

require 'stringio'
require_relative '../../chapter_05_hash_tables/load_factor'

RSpec.describe Algorithm::LoadFactor do
  describe '.demo_load_factor' do
    it 'prints the correct load factors for given item counts' do
      expected_output = <<~OUTPUT
        Items: 2, Table size: 10, Load Factor: 0.20
        Items: 5, Table size: 10, Load Factor: 0.50
        Items: 8, Table size: 10, Load Factor: 0.80
        Items: 10, Table size: 10, Load Factor: 1.00
        Items: 15, Table size: 10, Load Factor: 1.50
      OUTPUT

      original_stdout = $stdout
      $stdout = StringIO.new

      described_class.demo_load_factor

      output = $stdout.string
      $stdout = original_stdout

      expect(output).to eq(expected_output)
    end
  end
end
