# @param {String} s
# @return {String}
def make_good(s)
  i = 0
  while i < s.size - 1  do
    if (s[i].ord - s[i+1].ord).abs == 32
      s.slice!(i)
      s.slice!(i)
      i = [i - 1, 0].max
    else
      i += 1
    end
  end

  s
end
