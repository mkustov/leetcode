# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  matrix_size = matrix.first.size
  (matrix_size / 2).times do |offset|
    p offset: offset
    rotate_elements(matrix, matrix_size, offset)
  end
end

def rotate_elements(matrix, matrix_size, offset)
  (matrix_size - 1 - (offset * 2)).times do |i|
    swap(matrix,
      [0 + offset, 0 + offset + i],
      [0 + offset + i, matrix_size - offset - 1],
      [matrix_size - offset - 1, matrix_size - offset - 1 - i],
      [matrix_size - offset - 1 - i, 0 + offset])
  end
end

def swap(matrix, top, right, bottom, left)
  top_value = matrix[top.first][top.last]
  right_value = matrix[right.first][right.last]
  bottom_value = matrix[bottom.first][bottom.last]
  left_value = matrix[left.first][left.last]

  matrix[top.first][top.last] = left_value
  matrix[right.first][right.last] = top_value
  matrix[bottom.first][bottom.last] = right_value
  matrix[left.first][left.last] = bottom_value
end

matrix = [[1,2,3],[4,5,6],[7,8,9]]
matrix.each { |row| p row }
puts '---'
rotate(matrix)
matrix.each { |row| p row }
