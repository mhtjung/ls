# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that 
# data may be either all numbers or strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays,
# then recombining those nested sub-arrays in sorted order. It is best shown by example. For example, let's merge sort the array
# [9, 5, 7, 1]. Breaking this down into nested sub-arrays, we get:

def merge(array1, array2)
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


def merge_sort(arr)
  return arr if arr.size == 1

  sub_arr1 = arr[0...arr.size / 2]
  sub_arr2 = arr[arr.size / 2...arr.size]

  sub_arr1 = merge_sort(sub_arr1)
  sub_arr2 = merge_sort(sub_arr2)

  merge(sub_arr1, sub_arr2)
end

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]