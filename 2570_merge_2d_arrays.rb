# @param {Integer[][]} nums1
# @param {Integer[][]} nums2
# @return {Integer[][]}
def merge_arrays(nums1, nums2)
  res = {}
  nums1.each do |index, value|
    res[index] = value
  end

  nums2.each do |index, value|
    res.key?(index) ? res[index] += value : res[index] = value
  end

  res.to_a.sort_by(&:first)
end

# Input: 
nums1 = [[1,2],[2,3],[4,5]]
nums2 = [[1,4],[3,2],[4,1]]
# Output: [[1,6],[2,3],[3,2],[4,6]]

p merge_arrays(nums1, nums2)
