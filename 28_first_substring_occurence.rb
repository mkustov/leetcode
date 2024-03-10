# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  index = haystack =~ /#{needle}/
  index.nil? ? -1 : index
end
