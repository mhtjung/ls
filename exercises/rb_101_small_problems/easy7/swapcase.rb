# Write a method that t akes a st ring as an argument and returns a new string in which every uppercase letter is 
# replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def swapcase(string)
  result = ''
  string.chars.each do |x|
    if UPPERCASE.include?(x)
      result << x.downcase
    elsif LOWERCASE.include?(x)
      result << x.upcase
    else
      result << x
    end
  end
  result
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'