# frozen_string_literal: true

module Algorithm
  def self.binary_search(list, target)
    start_list = 0
    end_list = list.length - 1

    while start_list <= end_list
      middle = (start_list + end_list) / 2
      kick = list[middle]

      return middle if kick == target

      if kick > target
        end_list = middle - 1
      else
        start_list = middle + 1
      end
      nil
    end
  end
end
