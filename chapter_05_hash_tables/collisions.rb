# frozen_string_literal: true

module Algorithm
  module Collisions
    TABLE_SIZE = 5

    def self.demo_collisions
      keys = %w[apple apricot banana berry cherry date]
      table = build_table(keys)
      print_table(table)
      print_total_collisions(table)
    end

    def self.build_table(keys)
      table = Array.new(TABLE_SIZE) { [] }
      keys.each do |key|
        index = key[0].ord % TABLE_SIZE
        table[index] << key
      end
      table
    end

    def self.print_table(table)
      puts 'Hash table with separate chaining (simulated linked list):'
      table.each_with_index do |bucket, idx|
        puts "Index #{idx}: #{bucket.inspect} (#{bucket.size} elements)"
      end
    end

    def self.print_total_collisions(table)
      total_collisions = table.sum { |bucket| bucket.size > 1 ? bucket.size - 1 : 0 }
      puts "\nTotal collisions: #{total_collisions}"
    end
  end
end
