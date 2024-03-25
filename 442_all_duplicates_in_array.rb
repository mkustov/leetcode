# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
  res = []

  nums.each do |num|
    abs_num = num.abs
    index = abs_num - 1

    res << abs_num if nums[index] < 0
    nums[index] *= -1
  end

  res
end
