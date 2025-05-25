# frozen_string_literal: true

module Algorithm
  module LoadFactor
    def self.demo_load_factor
      table_size = 10
      items_counts = [2, 5, 8, 10, 15]

      items_counts.each do |count|
        load_factor = count.to_f / table_size
        puts "Items: #{count}, Table size: #{table_size}, Load Factor: #{format('%.2f', load_factor)}"
      end
    end
  end
end
