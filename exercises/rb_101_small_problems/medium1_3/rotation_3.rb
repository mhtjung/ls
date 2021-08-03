=begin
Problem: Write a method that takes an integer as an argument and returns the maximum
rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from
the previous exercise.

Note that you do not have to handle multiple 0s

Examples: See below

Data Structures:
Input: Integer
Return: Integer
Output: N/A

Algorithm:

Split integer into digits array
create holder - []
Loop until array is empty
  reassign array to return of rotate array
  holder << array.shift
end



=end

require 'pry'
def max_rotation(int)
  arr = int.digits.reverse
  holder = []
  loop do
    break if arr.empty?
    arr = rotate_array(arr)
    holder << arr.shift
  end
  holder.join.to_i
end

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

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845