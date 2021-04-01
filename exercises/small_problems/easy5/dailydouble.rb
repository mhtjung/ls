#take a string
# split into arr
# iterate over arr
# if arr[x] == arr[x+1]


def crunch(string)
  result = ''
  string.chars.each_with_index do |letter, index|
    next if string[index] == string[index+1]
      result << letter
  end
  result
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''