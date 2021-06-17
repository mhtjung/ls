# Solution
  # We can improve the method by using non-destrutive methods within the method definition (change << to +=)
  # Then, when calling the method, we can use tuple-unpacking (idk the relevant Ruby term) as such new_string, new_array = method(old_string,old_array)

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"