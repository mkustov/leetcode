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
def reverse_list(head)
  # values = []

  # until head.nil?
  #   values << head.val
  #   head = head.next
  # end

  # new_head_node = ListNode.new(values.pop)
  # reversed_list = new_head_node
  # until values.empty?
  #   reversed_list.next = ListNode.new(values.pop)
  #   reversed_list = reversed_list.next
  # end

  # new_head_node

  previous_node = nil
  current_node = head

  until current_node.nil?
    next_node = current_node.next
    current_node.next = previous_node
    previous_node = current_node
    current_node = next_node
  end

  previous_node
end
