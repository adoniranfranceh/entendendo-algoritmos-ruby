# frozen_string_literal: true

require_relative 'recursion'
require_relative '../run_time'
require_relative 'shared_logic'

module Chapter03
  class Recursion
    include Algorithm::Recursion
    include RunTime
    include SharedLogic

    def self.run
      boxes = [1, 2, 3, [20, 30, [100], ['key'], [200, 500]]]
      key = 'key'
      list = [1, 2, 3, 4]

      measure_and_log(Algorithm::Recursion, boxes, key, list)
    end
  end
end

Chapter03::Recursion.run
