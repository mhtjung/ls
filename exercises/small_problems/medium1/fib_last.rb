def fibonacci_better(n)
  first, last = [1,1]
  3.upto(n) do
    first, last = [last, first + last]
  end
  last
end

def fibonacci_last(n)
  fibonacci_better(n).to_s.chars.last.to_i
end

fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) == 4 # -> 4

def fibo_last_better(n)
  last_2 = [1, 1]
  3.upto(n) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end
