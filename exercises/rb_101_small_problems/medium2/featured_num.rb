# A featured number is an odd number that is a multiple of 7 and whose digits occur exactly once.

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument.

# Return an error message if there is no next feature number.
require 'pry'

def no_repeats?(num)
  num.to_s.chars == num.to_s.chars.uniq
end

def is_featured?(num)
  no_repeats?(num) && (num % 7 == 0) && num.odd?
end

def featured(num)
  num += 1
  num += 1 until num % 7 == 0 && num.odd? == true

  loop do
    return num if is_featured?(num)
    num += 14
    break if num >= 99876543210
  end

  "Error message"
end


puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
#featured(9_999_999_999) # -> There is no possible number that fulfills those requirements