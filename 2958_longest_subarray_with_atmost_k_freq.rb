# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
require 'pry'
def max_subarray_length(nums, k)
  max_length = 0
  counts = {}

  i = 0
  j = 0
  while j < nums.size
    counts[nums[j]] = counts.fetch(nums[j], 0) + 1

    while counts.values.max > k
      counts[nums[i]] -= 1
      i += 1
    end

    p i: i
    p j: j
    p max_length: max_length
    p counts
    max_length = [(i..j).count, max_length].max
    j += 1
  end

  max_length
end

# nums = [1,2,3,1,2,3,1,2]
# k = 2

# nums = [1,2,1,2,1,2,1,2]
# k = 1

# nums = [5,5,5,5,5,5,5]
# k = 4

nums = [2,11]
k=1

p max_subarray_length(nums, k)
