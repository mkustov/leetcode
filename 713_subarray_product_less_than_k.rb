# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
require 'pry'
def num_subarray_product_less_than_k(nums, k)
  return 0 if k <= 1

  # subarrays_count = 0

  # nums.each_with_index do |num, i|
  #   j = i + 1
  #   running_product = num
  #   subarrays_count += 1 if num < k

  #   while j <= nums.size - 1 && (running_product * nums[j]) < k
  #     subarrays_count += 1
  #     running_product *= nums[j]
  #     j += 1
  #   end
  # end

  # subarrays_count

  i = 0
  j = 0
  window_product = 1
  subarrays_count = 0

  n = nums.size

  while j < n
    window_product *= nums[j]

    while window_product >= k
      window_product /= nums[i]
      i += 1
    end

    subarrays_count += 1 + (j - i)
    j += 1
  end

  subarrays_count
end

# nums = [10,5,2,6]
# k = 100
# 8

nums = [1,1,1]
# k = 2
# 6

k = 1
#
p num_subarray_product_less_than_k(nums, k)
