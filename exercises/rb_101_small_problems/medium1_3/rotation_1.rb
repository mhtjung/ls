=begin
Problem:
  Write a method that rotates an array by moving the first element to the end of the array.
  The original array should not be modified
  Do not use Array#rotate or Array#rotate! for your implementation.

Examples: See Below

Data Structures:
Input: Array
Return: Array
Output: N/A

Algorithm:
Create copy of array using map
Remove first element and append it to the end.


=end

def rotate_array(arr)
  arr = arr.dup
  arr.push(arr.shift)
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true