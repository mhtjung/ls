#Write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, else returns false.

def xor?(a,b)
  if a == true && b == true
    return false
  elsif a == false && b== false
    return false
  else
    return true
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false