# @param {Integer} n
# @return {Integer}
def pivot_integer(n)
  val = Math.sqrt((n * n + n) / 2)
  val == val.to_i ? val.to_i : -1
end
