require 'pry'
# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  count = 0
  i = 0

  while i < s.size
    count += 1 if s[i] == '('
    count -= 1 if s[i] == ')'
    if count.negative?
      s.slice!(i)
      count += 1
    else
      i += 1
    end
  end

  count = 0


  i = s.size - 1

  while i >= 0
    count += 1 if s[i] == '('
    count -= 1 if s[i] == ')'
    if count.positive?
      s.slice!(i)
      count -= 1
    end
    i -= 1
  end

  s
end

s = "))(("

p min_remove_to_make_valid(s)

