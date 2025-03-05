# @param {Integer} n
# @return {Boolean}
def check_powers_of_three(n)
  while n > 0
    # If the remainder of n divided by 3 is 2, it's not possible to represent n as the sum of distinct powers of three
    if n % 3 == 2
      return false
    else
      # Update n to be the integer division of n by 3
      n /= 3
    end
  end

  true
end


# Input: 
n = 91
# Output: true

p check_powers_of_three(n)
