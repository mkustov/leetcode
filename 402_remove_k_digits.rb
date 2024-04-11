# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
  nums = num.each_char.map(&:to_i)

  # k.times do
  #   if nums[0] > nums[1].to_i
  #     nums.shift
  #   elsif nums[0] == nums[1]
  #     largest = [nums.detect { |n| n > nums[0] }.to_i, nums[0]].max
  #     nums.delete_at(nums.index(largest))
  #   else
  #     nums.delete_at(1)
  #   end
  # end

  stack = []

  nums.each do |n|
    while stack.any? && k > 0 && stack.last > n
      stack.pop
      k -= 1
    end

    stack << n
  end

  k.times { stack.pop }

  stack.shift while stack.any? && stack[0].zero?

  stack.any? ? stack.join('') : '0'
end
