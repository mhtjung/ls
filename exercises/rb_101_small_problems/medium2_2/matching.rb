# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced,
# false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

# Iterate through string.chars
  # If a ')' is found before a '(' return false
    # If a '(' is found, set variable to "open"

