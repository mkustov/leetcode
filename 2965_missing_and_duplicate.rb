require 'pry'
# @param {Integer[][]} grid
# @return {Integer[]}
def find_missing_and_repeated_values(grid)
  a = b = nil
  sorted_flat = grid.flatten!.sort!

  size = sorted_flat.size
  sorted_flat.each_with_index do |n, i|
    a = n if n == sorted_flat[i+1]
    b = n + 1 if n == sorted_flat[i+1].to_i - 2
    break if !a.nil? && !b.nil?

  end
  
  if b.nil?
    b = sorted_flat.first == 2 ? 1 : b = size 
  end

  [a,b]
end

# Input: 
# grid = [[1,3],[2,2]]
# Output: [2,4]

# Input: 
# grid = [[9,1,7],[8,9,2],[3,4,6]]
# Output: [9,5]

grid = [[1,2],[1,4]]

p find_missing_and_repeated_values(grid)
