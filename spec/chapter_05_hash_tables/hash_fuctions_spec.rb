# frozen_string_literal: true

require_relative '../../chapter_05_hash_tables/hash_functions'

RSpec.describe Algorithm::HashFunctions do
  describe '.hash_a' do
    it 'always returns 1 regardless of input' do
      expect(described_class.hash_a('anything')).to eq(1)
      expect(described_class.hash_a('')).to eq(1)
      expect(described_class.hash_a('123')).to eq(1)
    end
  end

  describe '.hash_b' do
    it 'returns 0 for empty string' do
      expect(described_class.hash_b('')).to eq(0)
    end

    it 'returns key length modulo TABLE_SIZE' do
      expect(described_class.hash_b('abc')).to eq(3)
      expect(described_class.hash_b('abcdefghij')).to eq(0)
      expect(described_class.hash_b('a' * 15)).to eq(5)
    end

    it 'returns same hash for same length' do
      expect(described_class.hash_b('12345')).to eq(described_class.hash_b('abcde'))
    end
  end

  describe '.hash_c' do
    it 'returns 0 for empty string (raises error)' do
      expect { described_class.hash_c('') }.to raise_error(NoMethodError)
    end

    it 'returns ASCII of first char modulo TABLE_SIZE' do
      expect(described_class.hash_c('a')).to eq('a'.ord % 10)
      expect(described_class.hash_c('zebra')).to eq('z'.ord % 10)
      expect(described_class.hash_c('Bob')).to eq('B'.ord % 10)
    end

    it 'returns same hash for same starting letter' do
      expect(described_class.hash_c('apple')).to eq(described_class.hash_c('ant'))
    end
  end

  describe '.hash_d' do
    it 'returns 0 for empty string' do
      expect(described_class.hash_d('')).to eq(0)
    end

    it 'is case insensitive' do
      expect(described_class.hash_d('abc')).to eq(described_class.hash_d('ABC'))
    end

    it 'returns same hash for anagrams (limitação conhecida)' do
      expect(described_class.hash_d('abc')).to eq(described_class.hash_d('cab'))
    end

    it 'returns same hash for repeated letters' do
      expect(described_class.hash_d('aa')).to eq((2 + 2) % 10)
      expect(described_class.hash_d('AAA')).to eq((2 + 2 + 2) % 10)
    end

    it 'ignores non-mapped characters' do
      expect(described_class.hash_d('a1b2')).to eq((2 + 3) % 10)
    end
  end

  describe '.demo_distribution' do
    let(:output) do
      capture_stdout do
        described_class.demo_distribution
      end
    end

    def capture_stdout
      original_stdout = $stdout
      $stdout = StringIO.new
      yield
      $stdout.string
    ensure
      $stdout = original_stdout
    end

    it 'prints distribution for all hash functions' do
      expect(output).to include('Hash A (return 1):')
      expect(output).to include('Hash B (size):')
      expect(output).to include('Hash C (first character):')
      expect(output).to include('Hash D (primes somados):')
    end

    it 'prints 10 indices for each hash function' do
      hash_names = [
        'Hash A (return 1):',
        'Hash B (size):',
        'Hash C (first character):',
        'Hash D (primes somados):'
      ]
      hash_names.each_with_index do |name, i|
        section = output.split(name)[1]

        if i < hash_names.size - 1
          next_title = hash_names[i + 1]
          section = section.split(next_title)[0]
        end

        counts = section.scan(/Index \d+: \d+ Inputs/)
        expect(counts.size).to eq(10)
      end
    end

    it 'shows non-zero counts for some indices' do
      expect(output).to match(/Index \d+: [1-9]\d* Inputs/)
    end

    it 'shows zero counts for some indices' do
      expect(output).to match(/Index \d+: 0 Inputs/)
    end
  end
end
