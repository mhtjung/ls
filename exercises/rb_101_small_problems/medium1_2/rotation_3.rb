# Write a method that takes an integer as an argument, and returns the maximum rotation of that argument. You can and probably should
# use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s

def rotate_array(array)
  array[1..] << array.first
end

def rotate_rightmost_digits(number, num_of_digits)
  array = number.digits.reverse
  digits_to_rotate = array.pop(num_of_digits)
  new_digits = rotate_array(digits_to_rotate)
  array << new_digits
  array.join.to_i
end

def max_rotation(number)
  # convert number into array of digits
  number.digits.size.downto(1).each do |x|
    number = rotate_rightmost_digits(number, x)
  end
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845

