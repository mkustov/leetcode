# @param {String} s
# # @return {Integer}
# def max_depth(s)
#   return 0 unless valid_parentheses?(s)

#   max_depth = 0
#   s.match(/\(+.*(\S)/).to_a.each do |m|
#     open_brack = 0
#     closed_brack = 0
#     m.each_char do |c|
#       next unless c == '(' || c == ')'

#       open_brack += 1 if c == '('
#       closed_brack += 1 if c == ')'
#       max_depth = [open_brack - closed_brack, max_depth].max
#     end
#   end

#   max_depth
# end

# def valid_parentheses?(s)
#   open_brackets = []
#   s.each_char do |c|
#     next unless c == '(' || c == ')'

#     if c == '('
#       open_brackets << c
#     else
#       if open_brackets.last == '('
#         open_brackets.pop
#       else
#         return false
#       end
#     end
#   end

#   open_brackets.empty?
# end

# # s = "(1+(2*3)+((8)/4))+1"
# # 3

# s = "(1)+((2))+(((3)))"
# # 3

# p max_depth(s)

def max_depth(s)
  count = 0
  max = 0

  s.each_char do |c|
    count += 1 if c == '('
    max = [count, max].max
    count -= 1 if c == ')'
  end

  max
end
