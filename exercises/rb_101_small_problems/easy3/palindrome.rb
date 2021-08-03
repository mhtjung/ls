def palindrome?(str)
  str.reverse == str
end

def cleaner(str)
  str = str.downcase.delete('^a-z0-9')
end

def palindrome2?(str)
  cleaner(str)
  palindrome?(str)
end


puts palindrome2?('madam') == true
puts palindrome2?('Madam') == false          # (case matters)
puts palindrome2?("madam i'm adam") == false # (all characters matter)
puts palindrome2?('356653') == true