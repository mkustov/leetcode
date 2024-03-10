require 'pry'
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return nil if n == 1 && head.next.nil?
  # doesn't work

  p1 = 0
  p2 = 0
  tmp_head = head
  new_head = head
  new_current_head = head

  until head.nil?
    head = head.next
    if p1 - p2 > n
      p2 += 1
      new_current_head = new_head.next
      new_head = new_head.next
    end
    p1 += 1
  end

  new_current_head.next = new_current_head.next.next

  tmp_head
end

head = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
# head = ListNode.new(1, ListNode.new(2))
p head
puts '---'
remove_nth_from_end(head, 2)
p head
