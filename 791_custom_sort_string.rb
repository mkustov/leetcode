# @param {String} order
# @param {String} s
# @return {String}
def custom_sort_string(order, s)
  order_arr = order.each_char.to_a
  s_arr = s.each_char.to_a

  order_values = {}
  order_arr.each_with_index { |e,i| order_values[e] = i }

  sorted = s_arr.reject { |e| order_values[e].nil? }.sort_by! { |e| order_values[e] }

  (sorted + (s_arr - order_arr)).join
end
