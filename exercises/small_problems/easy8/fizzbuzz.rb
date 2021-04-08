# Write a method that takes two arguments: The first is the starting number and the second number is the ending number.
# Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz"; if a number is divisible by
# 5, print "Buzz", if both, print "FizzBuzz"

def fizzbuzz(start,finish)
  arr = (start..finish).to_a
  result = []
  arr.each do |num|
    if num % 5 == 0 && num % 3 == 0
      result << 'FizzBuzz'
    elsif num % 3 == 0
      result << 'Fizz'
    elsif num % 5 == 0
      result << 'Buzz'
    else
      result << num
    end
  end
  result
end

puts fizzbuzz(1,15)
