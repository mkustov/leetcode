# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def remove_zero_sum_sublists(head)
  nums = []
  until head.nil?
    nums << head.val
    head = head.next
  end

  # remove zeros since they always result to zero sum
  nums.reject! { |e| e == 0 }

  # for every element in array
  nums.each_with_index do |num, i|
    # skip already deleted elements
    next if num.nil?

    running_total = num
    # loop starting from next element until last in the array
    nums[i + 1..nums.size - 1].each_with_index do |num2, j|
      running_total += num2
      if running_total == 0
        # i + 1 - next from i,
        # j - current second pointer
        # we need to delete everything from i to j including both
        (i..i + 1 + j).to_a.each { |k| nums[k] = nil }
      end
    end
  end

  # remove 'deleted' elements (element == nil)
  nums.compact!

  # build linked list from array
  new_head = new_list = ListNode.new(nums.shift)
  nums.each do |e|
    new_list.next = ListNode.new(e)
    new_list = new_list.next
  end

  new_head
end
