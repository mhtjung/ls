def leading_substrings(string)
  result = []
  1.upto(string.length) do |x|
    result << string.slice(0,x)
  end
  result
end

def substrings(string)
  result = []
  arr = string.chars
  string.size.times do |x|
    result.concat(leading_substrings(arr.join''))
    arr.shift
  end
  result
end

def palindromes(string)
  substrings = substrings(string)
  result = substrings.select {|x| x == x.reverse && x.size>1}
  result
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
