# Write a method that takes two integers as arguments. The first arguemnt is a count,
# the second is the first number of a sequence.

# The method should return an Array that contains the same number of elements as the count argument,
# while the values of each element will be multiples of the starting number

def sequence(length, start_num)
  result = []
  length.times do |x|
    result << (x+1)*start_num
  end
  result
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []