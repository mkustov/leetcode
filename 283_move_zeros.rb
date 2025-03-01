require 'pry'
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  nums_size = nums.size
  nums.reject! { |num| num == 0 }
  (nums_size - nums.size).times { nums << 0 }
  nums
end



nums = [0,1,0,3,12]
# Output: [1,3,12,0,0]

# nums = [0]
# Output: [0]

# nums = [1]
nums = [1,0]

p move_zeroes(nums)

def move_zeroes_pointers(nums)
  slow = 0
  nums.each_with_index do |num, fast|
    if num != 0
      nums[slow] = num
      slow += 1
    end
  end

  (slow..nums.size-1).each do |i|
    nums[i] = 0
  end

  nums
end


p move_zeroes_pointers(nums)
