# @param {Integer[]} nums
# @return {Integer[]}
def apply_operations(nums)
  nums_size = nums.size
  nums.each_with_index do |num, i|
    if num == nums[i+1]
      nums[i] = num * 2
      nums[i+1] = 0
    end
  end
  nums.reject! { |num| num == 0 }
  (nums_size - nums.size).times { nums << 0 }
  nums
end


# nums = [1,2,2,1,1,0]
# [1,4,2,0,0,0]

nums = [0,1]
# Output: [1,0]

p apply_operations(nums) # [1,4,2,0,0,0]
