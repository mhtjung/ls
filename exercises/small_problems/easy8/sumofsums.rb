# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that array.

def sum_of_sums(arr)
  sum = 0
  1.upto(arr.length) do |x|
    sum += arr.slice(0,x).inject(:+)
  end
  sum
end


puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35