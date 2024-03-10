# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # unique_chars = []
  # s.each_char do |char|
  #   if unique_chars.include?(char)
  #     break
  #   else
  #     unique_chars << char
  #   end
  # end

  # reverse_unique_chars = []
  # s.reverse.each_char do |char|
  #   if reverse_unique_chars.include?(char)
  #     break
  #   else
  #     reverse_unique_chars << char
  #   end
  # end
  # puts [unique_chars.size, reverse_unique_chars.size].max


  longest_unique_substring = []
  string_size = s.size

  string_size.times do |index|
    tmp_substring = []

    s[index..string_size].each_char do |substring_char|
      if tmp_substring.include?(substring_char)
        break
      else
        tmp_substring << substring_char
      end
    end

    if tmp_substring.size > longest_unique_substring.size
      longest_unique_substring = tmp_substring
    end
  end

  puts longest_unique_substring.join('')
  puts longest_unique_substring.size
end

length_of_longest_substring(ARGV[0])
