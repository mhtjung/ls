=begin
Problem: Write a method that can rotate the last n digits of a number.

Example: See Below

Data Structures:
Input: Integer
Return: Integer
Output: N/A

Algorithm:

Split integer into an array of digits
Remove the last n digits from the array

Join those digits and pass them to rotate_array
Save the return of rotate_array to a variable

Combine original remaning digits and the return of rotate_array
=end


def rotate_rightmost_digits(int, n)
  arr = int.digits.reverse
  to_rotate = arr.slice!(-n..)
  rotated = rotate_array(to_rotate)
  arr.concat(rotated)
  arr.join.to_i
end

def rotate_array(arr)
  arr = arr.dup
  arr.push(arr.shift)
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917