# frozen_string_literal: true

require_relative 'recursion_iterative'
require_relative '../../run_time'

module Chapter03
  class Iterative
    include Algorithm::Iterative
    include RunTimeinclude SharedLogic

    def self.run
      boxes = [1, 2, 3, [20, 30, [100], ['key'], [200, 500]]]
      key = 'key'
      list = [1, 2, 3, 4]

      measure_and_log(Algorithm::Iterative, boxes, key, list)
    end
  end
end

Chapter03::Iterative.run
