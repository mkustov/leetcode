# @param {Integer[]} nums
# @return {Integer}
# def first_missing_positive(nums)
#   missing_positive = 1
#   nums.select!(&:positive?)
#   nums.uniq!
#   nums.sort!

#   while nums.size > 0
#     num = nums.shift

#     if missing_positive < num
#       nums = []
#       break
#     end

#     if missing_positive == num
#       missing_positive = num + 1
#     end
#   end

#   missing_positive
# end

def first_missing_positive(nums)
  nums.size.times do |i|
    while nums[i].positive? && nums[i] <= nums.size && nums[i] != nums[nums[i] - 1]
      swap(nums, i, nums[i] - 1)
    end
  end

  nums.size.times do |i|
    return i + 1 if nums[i] != i + 1
  end + 1
end

def swap(array, i, j)
  array[j], array[i] = array.values_at(i, j)
end

# nums = [7,8,9,11,12]
# 1

# nums = [3,4,-1,1]
# 2

# nums = [1,2,0]
# 3

nums = [1]
# 2

p first_missing_positive(nums)
