# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are sequence of non-blank characters.
# You may assume that the input string will always contain at least two words.

def penultimate(string)
  string.split(' ')[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'