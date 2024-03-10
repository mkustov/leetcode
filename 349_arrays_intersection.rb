# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
  # nums1.uniq!
  # nums2.uniq!
  # nums1.select { |e| nums2.include?(e) }
  nums1 & nums2
end
