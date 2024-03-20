require 'pry'
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} list1
# @param {Integer} a
# @param {Integer} b
# @param {ListNode} list2
# @return {ListNode}
def merge_in_between(list1, a, b, list2)
  current_head = list1
  current_head_b = list1

  while a - 2 >= 0 do
    current_head = current_head.next
    a -= 1
  end

  while b >= 0
    current_head_b = current_head_b.next
    b -= 1
  end

  current_head.next = list2

  until list2.next.nil?
    list2 = list2.next
  end

  list2.next = current_head_b

  list1
end

list1 = ListNode.new(10, ListNode.new(1, ListNode.new(13, ListNode.new(6, ListNode.new(9, ListNode.new(5))))))
a = 3
b = 4
list2 = ListNode.new(1000000, ListNode.new(1000001, ListNode.new(1000002)))

p merge_in_between(list1, a, b, list2)
