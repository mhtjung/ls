# Write a method that computes the difference between the square of the sum of the first n positive integers and the
# sum of the squares of the first n positive integers

def square_o_sum(n)
  (0..n).to_a.sum**2
end

def sum_o_squares(n)
  (0..n).to_a.map{|x| x**2}.sum
end

def sum_square_difference(n)
  square_o_sum(n) - sum_o_squares(n)
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150