# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
  deck.sort!.reverse!
  res = []

  deck.each do |card|
    res.unshift(res.pop) if res.any?

    res.unshift(card)
  end

  res
end
