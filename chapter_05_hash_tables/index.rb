# frozen_string_literal: true

require_relative 'hash_functions'
require_relative 'caching'
require_relative 'collisions'
require_relative 'load_factor'
require_relative '../run_time'

module Chapter05
  class HashTable
    def self.run
      result_index = collect_results
      print_results(result_index)
    end

    def self.collect_results
      [
        RunTime.measure('HashFunctions Distribution') { Algorithm::HashFunctions.demo_distribution },
        RunTime.measure('Caching Distribution')       { Algorithm::Caching.demo_cache },
        RunTime.measure('Collision Distribution')     { Algorithm::Collisions.demo_collisions },
        RunTime.measure('LoadFactor Distribution')    { Algorithm::LoadFactor.demo_load_factor }
      ]
    end

    def self.print_results(result_index)
      puts "\nResults:"
      result_index.each do |r|
        puts " - #{r[:algorithm]}: time=#{r[:time]}s"
      end
    end
  end
end

Chapter05::HashTable.run
