# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  hash = {}
  res = nums.detect do |num|
    if hash[num]
      true
    else
      hash[num] = 1
      false
    end
  end

  res
end
