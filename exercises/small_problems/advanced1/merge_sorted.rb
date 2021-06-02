# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

require 'pry'

=begin
create working copies of arr1 and arr2
create result array

initiate loop
  check if either array is empty
    if both are empty
      break
  check which of the two arrays is lesser
  
=end


def merge_sorted(array1, array2)
  result = []
  arr1, arr2 = array1.dup, array2.dup
  loop do
    result += arr2.shift(arr2.size) if arr1.empty?
    result += arr1.shift(arr1.size) if arr2.empty?
    break if arr1.empty? && arr2.empty?
    result << arr1.shift if arr1.first < arr2.first
    result << arr2.shift if arr2.first < arr1.first
  end
  result
end

arr1 = [1, 5, 9]
arr2 = [2, 6, 8]

p merge_sorted(arr1, arr2)
p arr1, arr2


puts merge_sorted([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge_sorted([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge_sorted([], [1, 4, 5]) == [1, 4, 5]
puts merge_sorted([1, 4, 5], []) == [1, 4, 5]