# ascii_string.rb

# Write a method that determines and returns the ASCII string value of a string that is passsed in as an argument.

def ascii_value(str)
  str.chars.map {|char| char.ord}.sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0