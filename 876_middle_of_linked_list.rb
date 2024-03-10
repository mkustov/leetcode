# # Definition for singly-linked list.
# # class ListNode
# #     attr_accessor :val, :next
# #     def initialize(val = 0, _next = nil)
# #         @val = val
# #         @next = _next
# #     end
# # end
# # @param {ListNode} head
# # @return {ListNode}
# def middle_node(head)
#   original_head = head
#   length = 0
#   vals = []

#   until head.nil?
#     length += 1
#     head = head.next
#   end

#   (length / 2).times do
#     original_head = original_head.next
#   end

#   original_head
# end

def middle_node(head)
  middle = regular = head

  while regular && regular.next do
    middle = middle.next
    regular = regular.next.next
  end

  middle
end
