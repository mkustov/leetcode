require 'pry'
# @param {Integer} left
# @param {Integer} right
# @return {Integer[]}
def closest_primes(left, right)
  result = [-1, -1]

# #   return [2,3] if left == 2 && right == 3
#   nums = Array.new(right) { |i| i+1 }
  
#   i = 2
#   right_root = Math.sqrt(right).to_i
#   while i <= right_root

#     if nums[i-1]
#       j = i ** 2
      
#       count = 1

#       while j <= right
#         nums[j-1] = nil
#         j = i ** 2 + count*i
        
#         count += 1
        
#       end
#     end
#     i += 1
#   end

#   return result unless nums.compact!
  
#   primes = nums - (0...left).to_a
#   primes.delete(0)
#   primes.delete(1)

  nums = Array.new(right + 1, true)
  nums[0] = nums[1] = false

  (2..Math.sqrt(right).to_i).each do |i|
    if nums[i]
      (i * i).step(right, i) do |j|
        nums[j] = false
      end
    end
  end

  primes = []
  (left..right).each do |i|
    primes << i if nums[i]
  end

  min_diff = Float::INFINITY
  
  return result if primes.size < 2

  (0...primes.size - 1).each do |i| 
    diff = primes[i+1] - primes[i]
    if diff < min_diff
      min_diff = diff
      result = [primes[i], primes[i+1]]
    end
  end

  result

  # require 'prime'
  # Prime.each(right).filter do |v| 
  #   v >= left
  # end.each_cons(2).min_by {|(a, b)| b - a } || [-1, -1]
end


# left = 1
# right = 100

# Input: 
# left = 10
# right = 19
# Output: [11,13]


# left = 4
# right = 6

# left = 19
# right = 31

# left = 822
# right = 838394

# left = 183
# right = 905098



p closest_primes(left, right)
