# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  shash = {}
  thash = {}
  s.each_char.to_a.each_with_index do |c, i|
    if shash[c]
      shash[c] << i
    else
      shash[c] = [i]
    end
  end

  t.each_char.to_a.each_with_index do |c, i|
    if thash[c]
      thash[c] << i
    else
      thash[c] = [i]
    end
  end

  shash.values.sort == thash.values.sort
end
