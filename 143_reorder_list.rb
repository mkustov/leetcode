# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  slow = head
  fast = head
  second_half = []

  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  slow = slow.next if fast

  second_half_list = slow
  while second_half_list
    second_half << second_half_list.val
    second_half_list = second_half_list.next
  end

  slow.next = nil

  p head: head
  current = head
  until second_half.empty?
    value = second_half.pop
    temp_left = current.next
    if temp_left == value
      current.next = ListNode.new(value, nil)
      break
    else
      current.next = ListNode.new(value, temp_left)
    end
    current = current.next.next
  end

  current.next = nil

  head
end
