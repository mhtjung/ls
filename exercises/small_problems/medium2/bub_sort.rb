require 'pry'

def bubble_sort(arr)
  loop do    
    arr.each_with_index do |x, index|
      if x > arr[index + 1]
        swap(arr, index, index + 1)
        swap_count += 1
      end
    end
  end
end

def swap(arr, idx1, idx2)
  a, b = arr[idx1], arr[idx2]
  arr[idx1], arr[idx2] = b, a
end


arr = [5, 4, 3, 2, 8, 1]

arr.each_with_index do |x, idx|
  swap(arr, idx, idx+1)
end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size-1) do |index|
      next if array[index-1] <= array[index]
      array[index-1], array[index] = array[index], array[index-1]
      swapped = true
    end

    break unless swapped
  end
  nil
end
