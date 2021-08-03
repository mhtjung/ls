# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

def rotate_array(array)
  array[1..] << array.first
end

puts rotate_array([1,2,3,4])
