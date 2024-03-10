# @param {Integer[]} nums
# @return {Integer}
def max_frequency_elements(nums)
   counts = {}
   nums.each do |num|
    counts[num].nil? ? counts[num] = 1 : counts[num] += 1
   end

   max_occurence = counts.values.max
   counts.select { |k,v| v == max_occurence }.sum {|k,v| v }
end

