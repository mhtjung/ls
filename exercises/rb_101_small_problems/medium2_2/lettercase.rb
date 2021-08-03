# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string
# that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither

# You may assume the string will always contain at least one character.

def letter_percentages(string)
  results = {}
  percentages = {}
  arr = string.chars
  results[:lowercase] = arr.count {|x| x =~/[a-z]/}
  results[:uppercase] = arr.count {|x| x =~ /[A-Z]/}
  results[:neither] = arr.count {|x| x =~/[^A-Za-z]/}
  convert_to_percentages(percentages, results, arr.size)
  results
end

def convert_to_percentages(percentages, results, count)
  results[:lowercase] = (results[:lowercase]/count.to_f)*100
  results[:uppercase] = (results[:uppercase]/count.to_f)*100
  results[:neither] = (results[:neither]/count.to_f)*100
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
