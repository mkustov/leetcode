require 'pry'
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  res = Set.new
  nums.sort!
  (0..nums.size-4).each do |i|
    next if i > 0 && nums[i] == nums[i-1]

    (i+1..nums.size-3).each do |j|      
      # (j..nums.size-2).each do |k|
      #   next if j == k
      
      #   (k..nums.size-1).each do |l|
      #     next if k == l
      
      #     if nums[i] + nums[j] + nums[k] + nums[l] == target
      #       binding.pry if nums[i] == -3 && nums[j] == -1 && nums[k] == -1 && nums[l] == 5
      #       res << [nums[i], nums[j], nums[k], nums[l]]
      #     end
      #   end
      # end

      next if j > i+1 && nums[j] == nums[j-1]

      left = j + 1
      right = nums.size - 1

      while left < right
        sum = nums[i] + nums[j] + nums[left] + nums[right]
        
        if sum == target
          res << [nums[i], nums[j], nums[left], nums[right]]
          right -= 1

          while nums[right] == nums[right+1]
            right -= 1

            break if right == left
          end
          
        elsif sum < target
          left += 1
        else
          right -= 1
        end
      end
    end
  end
  res.to_a

  # res = []
  # nums.sort!
  # (0..nums.size-4).each do |i|

  # end
end

# Input: 
nums = [1,0,-1,0,-2,2]
target = 0
# Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]


# nums = [2,2,2,2,2]
# target = 8
# Output: [[2,2,2,2]]

nums = [-3,-1,0,2,4,5]
target = 0
# Output: [[-3,-1,0,4]]

# nums = [-497,-473,-465,-462,-450,-445,-411,-398,-398,-392,-382,-376,-361,-359,-353,-347,-329,-328,-317,-307,-273,-230,-228,-227,-217,-199,-190,-175,-155,-151,-122,-102,-97,-96,-95,-87,-85,-84,-73,-71,-51,-50,-39,-24,-19,-1,-1,7,22,25,27,37,40,43,45,51,72,91,97,108,119,121,122,123,127,156,166,171,175,180,203,211,217,218,224,231,245,293,297,299,300,318,326,336,353,358,376,391,405,423,445,451,459,464,471,486,487,488]
# target = 2251

nums = [-492,-465,-454,-450,-416,-403,-384,-378,-377,-368,-360,-341,-325,-322,-315,-310,-309,-284,-275,-274,-271,-264,-255,-248,-245,-232,-222,-212,-211,-204,-184,-137,-133,-128,-120,-117,-109,-92,-88,-61,19,19,32,37,39,55,60,94,98,187,187,216,254,272,284,284,290,295,323,328,336,411,428,440]
target = 1154

p four_sum(nums, target)
