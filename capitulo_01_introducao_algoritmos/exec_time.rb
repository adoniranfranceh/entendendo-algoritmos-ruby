# frozen_string_literal: true

require 'benchmark'

module ExecTime
  def self.measure(label)
    result = nil

    time = Benchmark.measure do
      result = yield
    end

    { algorithm: label, time: time.real.round(6), result: }
  end
end
