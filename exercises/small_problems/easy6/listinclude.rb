# Write a method named include? that takes an array and a search value as arguments. This method should return true if the search value is in the array
# false if it is not. Don't use Array#include?

def include?(arr, target)
  arr.each {|x| return true if x == target}
  false
end


puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false