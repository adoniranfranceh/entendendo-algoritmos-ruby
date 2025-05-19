# frozen_string_literal: true

module SharedLogic
  def measure_and_log(algorithm_module, boxes, key, list)
    result_index = []
    result_index << RunTime.measure("#{algorithm_module} find_key") { algorithm_module.find_key(boxes, key) }
    result_index << RunTime.measure("#{algorithm_module} factorial") { algorithm_module.factorial(5) }
    result_index << RunTime.measure("#{algorithm_module} recursive_sum") { algorithm_module.recursive_sum(list) }

    logs(list, key)
    result_index.each do |r|
      puts " - #{r[:algorithm]}: index=#{r[:result]}, time=#{r[:time]}s"
    end
  end

  def logs(list, value)
    puts "Include value? #{list.include?(value)}"
    puts "It is ordered? #{list == list.sort}"
    puts 'Results:'
    puts "List of #{list[0]} to #{list[-1]}"
  end
end
