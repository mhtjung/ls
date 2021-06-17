# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will
# be 'in-place'; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

# set variable sorted = true
# create loop
  # every loop, iterate over the contents of arr
    # if arr[x] > arr[x+1], swap them

  # break out of loop is sorted == false


def bubble_sort!(arr)
  n = arr.size
  loop do
    swapped = false
    1.upto(n-1) do |i|
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true
      end
    end
    break if swapped == false
  end
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)