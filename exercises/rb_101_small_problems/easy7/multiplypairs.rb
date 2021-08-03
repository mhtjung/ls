# WRite a method that takes two Array arguments in which each array contains a list of numbers, and returns a new Array
# that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results
# should be sorted by increasing value.

def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |x|
    arr2.each do |y|
      result << x*y
    end
  end
  result.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]