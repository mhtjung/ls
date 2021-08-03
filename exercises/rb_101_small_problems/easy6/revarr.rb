# Write a method that takes an Array as an argument, and reverses its elements in place; that is,
# mutate the Array passed into this method. The return value should be the same Array object.

def reverse!(arr)
  temp = []
  arr.length.times do
    temp << arr.pop
  end
  temp.length.times do
    arr.push(temp.shift)
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true