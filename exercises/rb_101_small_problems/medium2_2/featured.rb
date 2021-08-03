# A featured number is:
# An odd number
# A multiple of 7
# Whose digits do not repeat

# Start with method to determine if a number is a featured number

def is_featured?(number)
  number.odd? && number%7 == 0 && number.to_s.chars.uniq == number.to_s.chars
end

def featured(number)
  number += 1 
  number += 1 until is_featured?(number)
  if number >= 9876543210
    return "There is no possible number that fulfills those requirements"
  end
  number
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements