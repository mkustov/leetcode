# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.nil?
  return 1 if nums.size == 1
  # nums.uniq!
  # nums.size

  total_unique = 0
  nums.size.times do |index|
    if nums[index + 1] != nums[index]
      nums[total_unique] = nums[index]
      total_unique += 1
    end
  end

  total_unique
end
