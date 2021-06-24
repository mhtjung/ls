# Write a function that given positive integer n returns an array of all positive non-prime odd numbers less than n

require 'prime'

def odd_not_prime(n)
  arr = (1..n).to_a.select{|x|x.odd? && Prime.prime?(x) == false}.size

end

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20