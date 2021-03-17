# write a method that takes one argument, a positive integer, 
# and returns the sum of its digits

def sum(num)
  num.to_s.split('').map!{|x|x.to_i}.sum
end

puts sum(123)
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45