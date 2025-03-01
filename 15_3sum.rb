# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  res = Set.new
  nums.sort!
  (0..nums.size-3).each do |i|
    next if i > 0 && nums[i] == nums[i-1]

    left = i + 1
    right = nums.size - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum == 0
        res << [nums[i], nums[left], nums[right]]
        right -= 1

        while nums[right] == nums[right+1]
          right -=1

          break if left == right
        end
      
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end

  res.to_a
end

nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]

# nums = [0,1,1]
# Output: []

# nums = [0,0,0]
# Output: [[0,0,0]]

p three_sum(nums)
