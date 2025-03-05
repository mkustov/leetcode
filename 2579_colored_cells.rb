# @param {Integer} n
# @return {Integer}
def colored_cells(n)
  # new_cells = {
  #   1 => 1,
  #   2 => 4,
  #   3 => 8,
  #   4 => 12,
  #   5 => 16
  # }

  # res = 1
  # # while n > 0
  # #   res += new_cells[n]
  # #   n -= 1
  # # end
  # res = 1

  # while n > 0
  #   n -= 1
  #   res += n * 4
  # end

  # res

  2 * n * (n-1) + 1

end

n = 3
p colored_cells(n)
