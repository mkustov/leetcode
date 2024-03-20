require 'pry'
# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
    points = points.sort!

    arrows = 1
    baloon_end = points.shift[1]

    points.each do |baloon|
      if baloon[0] > baloon_end
        arrows += 1
        baloon_end = baloon[1]
      else
        baloon_end = [baloon_end, baloon[1]].min
      end
    end

    arrows
end


# points = [[10,16],[2,8],[1,6],[7,12]]
# 2

# points = [[1,2],[3,4],[5,6],[7,8]]
# 4

# points = [[1,2],[2,3],[3,4],[4,5]]
# 2

# points = [[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]]
# 2

points = [[9,12],[1,10],[4,11],[8,12],[3,9],[6,9],[6,7]]
# 2

p points: points
p find_min_arrow_shots(points)
