# shortlongshort.rb

def sls(a,b)
  if a.size > b.size
    return "#{b}#{a}#{b}"
  else
    return "#{a}#{b}#{a}"
  end
end

puts sls('abc', 'defgh') == "abcdefghabc"
puts sls('abcde', 'fgh') == "fghabcdefgh"
puts sls('', 'xyz') == "xyz"