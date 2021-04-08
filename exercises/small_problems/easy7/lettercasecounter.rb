# Write a method that takes a string, and then returns a hash that contains 3 entries:
# number of lowercase letters
# number of uppercase letters
# number of characters that are neither

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_case_count(string)
  upcase = 0
  downcase = 0
  other = 0

  string.chars.each do |x|
    if UPPERCASE.include?(x)
      upcase +=1
    elsif LOWERCASE.include?(x)
      downcase += 1
    else
      other +=1
    end
  end
  result = {lowercase: downcase, uppercase: upcase, neither: other}
end


puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }