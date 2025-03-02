require 'pry'
# @param {Integer[]} arr
# @return {Integer}
def len_longest_fib_subseq(arr)
  return 0 if arr.size < 3

  value_to_index = {}
  arr.each_with_index { |val, idx| value_to_index[val] = idx }

  dp = Hash.new { |h, k| h[k] = {} }
  max_length = 0

  arr.each_with_index do |val_i, i|
    (0...i).each do |j|
      val_k = val_i - arr[j]
      next unless val_k < arr[j] && value_to_index.key?(val_k)

      k = value_to_index[val_k]

      dp[j][i] = dp[k][j] ? dp[k][j] + 1 : 3
      max_length = [max_length, dp[j][i]].max
    end
  end

  max_length
end

# Input: 
arr = [1,2,3,4,5,6,7,8]
# Output: 5

# Input: 
# arr = [1,3,7,11,12,14,18]
# Output: 3

p len_longest_fib_subseq(arr)
