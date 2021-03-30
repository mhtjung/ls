#Prediction
  # The output will look like:
  # 'MY string looks like this now: pumpkinsrutabaga'
  # 'My array looks like this now: [pumpkins]
# Explanation
  # We see an exact opposite of Question 3. Here, the method modifies the string using a destructive method (<<) while it initializes a new 
  # array within the method definition. Therefore, after the method is run, the array parameter passed in remains unmolested.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

