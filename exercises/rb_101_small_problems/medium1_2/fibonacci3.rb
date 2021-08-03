# Write a method that returns the last digit of the nth Fibonacci number.

def fibonacci_last(num)
  fib = fibonacci(num)
  fib.to_s.chars.last.to_i
end

def fibonacci(number)
  fib_x, fib_y = [1, 1]
  3.upto(number) do
    fib_x, fib_y = [fib_y, fib_y + fib_x]
  end
  fib_y
end

puts fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
#fibonacci_last(123456789) # -> 4