# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  count = Array.new(26, 0)
    tasks.each do |ch|
        count[ch.ord - 'A'.ord] += 1
    end
    count.sort!
    max = count[25] - 1
    idle = max * n
    (24).downto(0) do |i|
        idle -= [count[i], max].min
    end
    return idle > 0 ? idle + tasks.length : tasks.length
end
