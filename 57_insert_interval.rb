# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)

  result = []

  intervals.each_with_index do |interval, i|
    if new_interval[1] > interval[0]
      result << new_interval
      return result + intervals[i...intervals.length]
    elsif new_interval[0] > interval[1]
      result << interval
    else
      new_interval = [[interval[0], new_interval[0]].min, [interval[1], new_interval[1]].max]
    end
  end

  result << new_interval
  result
end

# intervals = [[1,3],[6,9]]
# new_interval = [2,5]
# [[1,5],[6,9]]

intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
new_interval = [4,8]

p insert(intervals, new_interval)
