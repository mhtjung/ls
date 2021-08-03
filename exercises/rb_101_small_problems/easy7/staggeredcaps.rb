# Write a method that takes a String as an argument and returns a new string
# in which every other character is capitalized, and the remaining characters are lowercase.

def staggered_case(string)
  result = []
  string.chars.each {|x| result << x.downcase}
  result.each_with_index do |x, index|
    x.upcase! if index.even?
  end
  result.join('')
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'