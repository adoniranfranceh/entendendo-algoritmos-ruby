# frozen_string_literal: true

module Algorithm
  def self.simple_search(list, target)
    list.each_with_index do |item, i|
      return i if item == target
    end
    nil
  end
end
