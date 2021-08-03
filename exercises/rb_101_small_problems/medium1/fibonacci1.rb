# 1, 1, 2, 3, 5, 8,

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n -2)
end

puts fibonacci(5)
