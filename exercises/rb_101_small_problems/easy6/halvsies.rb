# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain
# the first half and second half of the original array, respectively. If the original array contains an odd number of elements
# the middle element should be placed in the first half of the array

def halvsies(array)
  if array.size.even?
    arr1 = array[0..((array.size/2) - 1)]
    arr2 = array[(array.size/2)..]
    result = [arr1, arr2]
  else
    arr1 = array[0..(array.size/2)]
    arr2 = array[((array.size/2)+1)..]
    result = [arr1, arr2]
  end
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]