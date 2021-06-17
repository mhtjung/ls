# Rewrite your recursive fibonacci method so that it computes its results without recursion

# 1 1 2 3 5 8
require 'pry'

def fibonacci(number)
  fib_x, fib_y = [1, 1]
  3.upto(number) do
    fib_x, fib_y = [fib_y, fib_y + fib_x]
  end
  fib_y
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
#puts fibonacci(100_001) # => 4202692702.....8285979669707537501