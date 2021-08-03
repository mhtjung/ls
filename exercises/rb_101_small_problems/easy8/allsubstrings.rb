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

p substrings('abcde')

