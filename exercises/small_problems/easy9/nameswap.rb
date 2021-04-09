# Write a method that takes a first name, a space, and a last name passed as single string argument
# and returns a string that contains the last name, a comma, a space, and the first name. 

def swap_name(str)
  "#{str.split[1]}, #{str.split[0]}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'