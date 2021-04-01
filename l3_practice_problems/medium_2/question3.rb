# Prediction: 
  # Output:
    # My string looks like this now: pumpkins
    # My array looks like this now: ['pumpkins','rutabaga']
  # Explanation:
    # The variable my_string will not be mutated while the array will be. (destructive vs non-destructive methods)

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
