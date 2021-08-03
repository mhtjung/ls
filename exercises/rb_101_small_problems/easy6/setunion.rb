def merge(arr1,arr2)
  arr1|arr2
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge2(arr1,arr2)
  (arr1+arr2).uniq
end
puts merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge3(arr1,arr2)
  result = []
  arr1.each {|x| result << x unless result.include?x}
  arr2.each {|x| result << x unless result.include?x}
  result
end
puts merge3([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
