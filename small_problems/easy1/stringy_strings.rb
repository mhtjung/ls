# write a method that takes one argument, a positive integer,
# and returns a string of alternatings 1s and 0s, starting with 1
# with a length equal to the argument

def stringy(num)
  result = ''
  num.times do |i|
    number = i.even? ? '1': '0'
    result += number
  end
  return result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'