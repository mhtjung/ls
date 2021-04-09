def uppercase?(str)
  comparison = ''
  str.chars.each {|x| comparison << x.upcase}
  str == comparison
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true