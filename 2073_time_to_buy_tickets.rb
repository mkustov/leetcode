# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
  seconds = 0
  t_k = tickets[k]
  tickets.each_with_index do |t, i|
    if i <= k
      seconds += [t, t_k].min
    else
      seconds += [t, t_k - 1].min
    end
  end

  seconds
end
