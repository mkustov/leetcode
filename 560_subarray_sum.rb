# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

def subarray_sum(nums, k)
  prefix_sums = Hash.new(0)
  prefix_sums[0] = 1
  total_sum = 0
  subarrays_count = 0

  nums.each do |num|
    total_sum += num
    remainder = total_sum - k
    subarrays_count += prefix_sums[remainder]
    prefix_sums[total_sum] += 1
  end
  subarrays_count
end

nums = [1,1,1]
k = 2
p subarray_sum(nums, k)
