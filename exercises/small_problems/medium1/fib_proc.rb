# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55

def fibonacci(n)
  return 1 if n == 1 || n == 2
  num1 = 1
  num2 = 1
  result = 0
  3.upto(n) do
    result = num1 + num2
    num1 = num2
    num2 = result
  end
  result
end
    
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075

def fibonacci_better(n)
  first, last = [1,1]
  3.upto(n) do
    first, last = [last, first + last]
  end
  last
end

puts fibonacci_better(500)