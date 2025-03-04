# @param {Integer[]} nums
# @param {Integer} pivot
# @return {Integer[]}
def pivot_array(nums, pivot)
  left = []
  right = []
  middle = []
  nums.each do |num|
    if num < pivot
      left << num
    elsif num > pivot
      right << num
    else
      middle << num
    end
  end

  left + middle + right
end

# Input: 
nums = [9,12,5,10,14,3,10]
pivot = 10
# Output: [9,5,3,10,10,12,14]

p pivot_array(nums, pivot)
