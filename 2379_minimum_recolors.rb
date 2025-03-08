# @param {String} blocks
# @param {Integer} k
# @return {Integer}
def minimum_recolors(blocks, k)
  min_res = k
  left = 0
  right = k
  
  while right <= blocks.size do
    window = blocks[left..right-1]
    res = window.each_char.select { |c| c == 'W' }.size
    min_res = res if res < min_res
    left += 1
    right += 1

    break if res == 0
  end

  min_res
end

# Input: 
# blocks = "WBBWWBBWBW"
# k = 7
# Output: 3

blocks = "BWWWBB"
k = 6

# blocks = "WBWW"
# k = 2


p minimum_recolors(blocks, k)
