=begin

It throws an error because the writer is trying to use a string method to combine
a string and an integer. It can be fixed by using .to_s for (40+2) or by using
string interpolation (probably better)

=end

# Example

puts "The value of 40+2 is #{40+2}"