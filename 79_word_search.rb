# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  set1 = board.flatten.to_set
  set2 = word.split('').to_set
  return false if set1 < set2

  board.each_with_index do |row, i|
    row.each_with_index do |_el, j|
      return true if dfs(board, word, i, j)
    end
  end

  false
end

def dfs(board, word, i, j)
  return true if word == ''
  return false if i < 0 || j < 0 || i >= board.length || j>= board[0].length || board[i][j]!=word[0]

  pom = board[i][j]
  board[i][j] = '#'
  word = word[1..-1]
  return true if dfs(board,word,i-1,j)
  return true if dfs(board,word,i,j-1)
  return true if dfs(board,word,i+1,j)
  return true if dfs(board,word,i,j+1)

  board[i][j] = pom
  false
end
