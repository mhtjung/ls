# multisum.rb

# create a range from 1 to number
# select all numbers from range that are divisible by 3 or 5
# sum the array of numbers

def multisum(num)
  my_arr = (1..num).to_a
  new_arr = my_arr.select {|x| x%3==0 || x%5==0}
  new_arr.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168