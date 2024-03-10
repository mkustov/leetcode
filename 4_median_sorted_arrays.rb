# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  merged_array = merge(nums1, nums2, nums1.size + nums2.size)

  merged_size = merged_array.size
  median_position = merged_size / 2

  if merged_size.odd?
    merged_array[merged_size / 2]
  else
    (merged_array[merged_size / 2 - 1] + merged_array[merged_size / 2]).to_f / 2
  end
end

def merge(left, right, size)
  result = []
  k = 0

  while k < size-1 do
    while left.any? && right.any?
      already_copied = false
      if left[0] < right[0]
        result << left.delete_at(0)
      else
        # @split += left.size unless already_copied
        already_copied = true
        result << right.delete_at(0)
      end
    end
    k += 1
  end

  while left.any?
    result << left.delete_at(0)
  end

  while right.any?
    result << right.delete_at(0)
  end

  result
end
