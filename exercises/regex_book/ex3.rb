# Write a method that changes the first arithmetic operator in a string to a '?' and returns the resulting string.
# Don't modify the original string

def mystery_math(string)
  string.sub(/[+\-*\/]/,'?')
end

puts mystery_math('4 + 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

puts mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'