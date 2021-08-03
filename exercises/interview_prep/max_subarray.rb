=begin
 
 Problem:
 The maximum sum subarray problem consists in findin the maximum sum of a continguous subsequence in an array of integers:
 
 Easy case is when the array is made up of only positive numbers and the max sum is the sum of the whole array.
 If the array is made up of only negative numbers, return 0 instead.
 
 
 Examples:
 maxSequence [-2,1,-3, 4,-1,2,1,-5,4] == 6 #because [4, -1, 2, 1]


Data Structures:
Input: Array
Return: Integer
Output: n/a


Algorithm:
Return 0 if all integers are negative
Return sum of array if all integers are positive

Construct holder object to store all possible sub arrays
Initialize starting point integer at 0

As many times as the array's length:
  Iterate over the array with their index
    For each iteration, slice from starting point to index
    Append this slice to the holder object
  After this loop, increment the counter object

Convert the array of subarrays to their respective sums

Return the maximum sum


  
=end
def generate_subarrays(arr)
  result = []
  counter = 0
  arr.size.times do |_|
    arr.each_with_index do |ele, idx|
      result << arr.slice(counter..idx) if arr.slice(counter..idx).empty? == false
    end
    counter += 1
  end
  result
end

def max_sequence(arr)
  return 0 if arr.all?{|x| x < 0}
  return arr.sum if arr.all?{|x| x > 0}
  subarrays = generate_subarrays(arr)
  sums = subarrays.map {|arr| arr.sum}
  sums.max
end

p max_sequence([-2,1,-3, 4,-1,2,1,-5,4]) == 6 #because [4, -1, 2, 1]
p max_sequence([]) == 0
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
