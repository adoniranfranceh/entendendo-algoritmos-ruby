# frozen_string_literal: true

module Algorithm
  module HashFunctions
    TABLE_SIZE = 10

    def self.hash_a(_key)
      1
    end

    def self.hash_b(key)
      key.length % TABLE_SIZE
    end

    def self.hash_c(key)
      key[0].ord % TABLE_SIZE
    end

    PRIME_MAP = {
      'a' => 2, 'b' => 3, 'c' => 5, 'd' => 7, 'e' => 11,
      'f' => 13, 'g' => 17, 'h' => 19, 'i' => 23, 'j' => 29,
      'k' => 31, 'l' => 37, 'm' => 41, 'n' => 43, 'o' => 47,
      'p' => 53, 'q' => 59, 'r' => 61, 's' => 67, 't' => 71,
      'u' => 73, 'v' => 79, 'w' => 83, 'x' => 89, 'y' => 97,
      'z' => 101
    }.freeze

    def self.hash_d(key)
      key.downcase.chars.sum { |char| PRIME_MAP[char] || 0 } % TABLE_SIZE
    end

    def self.demo_distribution
      keys = %w[Esther Ben Bob Dan Maus Fun Home Watchmen AA AAA AAAA]

      {
        'Hash A (return 1)' => method(:hash_a),
        'Hash B (size)' => method(:hash_b),
        'Hash C (first character)' => method(:hash_c),
        'Hash D (primes somados)' => method(:hash_d)
      }.each do |name, func|
        print_distribution(name, func, keys)
      end
    end

    def self.print_distribution(name, func, keys)
      puts "\n#{name}:"
      distribution = Array.new(TABLE_SIZE, 0)

      keys.each do |key|
        index = func.call(key)
        distribution[index] += 1
      end

      distribution.each_with_index do |count, i|
        puts "Index #{i}: #{count} Inputs"
      end
    end
  end
end
