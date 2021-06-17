# Write a method that changes every arithmetic operator to a '?' and returns the resulting string.


def mysterious_math(string)
  string.gsub(/[+\-*\/]/,'?')
end

puts mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
puts mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'