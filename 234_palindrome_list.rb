# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  # values = []
  # until head.nil?
  #   values << head.val
  #   head = head.next
  # end

  # values == values.reverse

  slow = head
  fast = head
  prev = nil

  # find the middle of the list by using fast and slow pointers and reverse the first half
  while fast && fast.next do
    fast = fast.next.next
    temp = slow.next
    slow.next = prev
    prev = slow
    slow = temp
  end

  slow = slow.next if fast

  # compare reversed first half and second half
  while prev && slow do
    return false if slow.val != prev.val

    slow = slow.next
    prev = prev.next
  end

  true
end
