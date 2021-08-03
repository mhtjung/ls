def leading_substrings(string)
  result = []
  1.upto(string.length) do |x|
    result << string.slice(0,x)
  end
  result
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']