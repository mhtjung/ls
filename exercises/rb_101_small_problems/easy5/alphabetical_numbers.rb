names = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty)
nums = (0..20).to_a
NUMNAMES = nums.zip(names).to_h
NAMENUMS = names.zip(nums).to_h

def alphabetic_number_sort(arr)
  result = arr.map{|x| NUMNAMES[x]}.sort.map{|x| NAMENUMS[x]}
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

