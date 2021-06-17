# Write a method that can rotate the last n digits of a number.
require 'pry'

def rotate_rightmost_digits(number, num_of_digits)
  array = number.digits.reverse
  digits_to_rotate = array.pop(num_of_digits)
  new_digits = rotate_array(digits_to_rotate)
  array << new_digits
  array.join.to_i
end

def rotate_array(array)
  array[1..] << array.first
end

puts rotated_number = rotate_rightmost_digits(735291,6)
puts rotated_number = rotate_rightmost_digits(rotated_number,5)
