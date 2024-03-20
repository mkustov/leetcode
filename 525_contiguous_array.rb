# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
  count = 0
  longest_size = 0
  cache = {}
  cache[0] = 0

  i = 0
  while i < nums.size
    nums[i] == 0 ? count -= 1 : count += 1

    if cache[count].nil?
      cache[count] = i + 1
    else
      current_max = i + 1 - cache[count]

      longest_size = [current_max, longest_size].max
    end

    i += 1
  end

  longest_size
end



# nums = [0,1,0,1,1]
# 2
nums = [0,0,0,1,1,1,0]
# 6

p find_max_length(nums)
