# cleanup.rb

# Given a string that consists of some words (all lower cased) and an assortment of non-alphabetic characters, write a method
# that returns the string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row,
# you should only have one space in the result (the result should never have consecutive spaces.)

def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '