# frozen_string_literal: true

require_relative '../../chapter_05_hash_tables/collisions'

RSpec.describe Algorithm::Collisions do
  describe '.build_table' do
    it 'places keys in correct buckets based on first character' do
      keys = %w[apple apricot banana berry cherry date]
      table = described_class.build_table(keys)
      expect(table).to be_an(Array)
      expect(table.size).to eq(described_class::TABLE_SIZE)
      expect(table.flatten).to match_array(keys)
    end

    it 'handles empty keys array' do
      table = described_class.build_table([])
      expect(table).to eq([[], [], [], [], []])
    end

    it 'handles collisions correctly' do
      keys = %w[apple apricot]
      table = described_class.build_table(keys)
      a_bucket_index = 'a'.ord % described_class::TABLE_SIZE
      expect(table[a_bucket_index]).to include('apple', 'apricot')
    end
  end

  describe '.print_table' do
    it 'prints the hash table structure' do
      table = [%w[apple apricot], [], ['banana'], ['berry'], %w[cherry date]]
      expect do
        described_class.print_table(table)
      end.to output(/Index 0: \["apple", "apricot"\] \(2 elements\)/).to_stdout
    end
  end

  describe '.print_total_collisions' do
    it 'prints the total number of collisions' do
      table = [%w[apple apricot], [], ['banana'], ['berry'], %w[cherry date]]
      expect { described_class.print_total_collisions(table) }.to output(/\nTotal collisions: 2/).to_stdout
    end

    it 'prints zero collisions for empty or single-element buckets' do
      table = [['apple'], [], ['banana'], ['berry'], ['cherry']]
      expect { described_class.print_total_collisions(table) }.to output(/\nTotal collisions: 0/).to_stdout
    end
  end

  describe '.demo_collisions' do
    it 'prints the table and total collisions' do
      expect { described_class.demo_collisions }
        .to output(/Hash table with separate chaining.*Total collisions:/m).to_stdout
    end
  end
end
