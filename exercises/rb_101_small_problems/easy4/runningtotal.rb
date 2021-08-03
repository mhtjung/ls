# runningtotal.rb

#get array
# iterate over array, using index -1 + current value in first array for value in second array

def running_total(arr)
  new_arr = []
  arr.each_with_index do |val,i|
    if i == 0
      new_arr << val
    else
      new_arr << val + new_arr[i-1]
    end
  end
  new_arr
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []