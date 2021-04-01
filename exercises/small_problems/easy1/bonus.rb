# write a method that takes two arguments, a positive integer and a
# boolean, and calculates the bonus for a given salar. If the bool
# is true, the bonus should be half of the salary. If the bool is 
# false, the bonus should be 0

def calculate_bonus(salary,bool)
  bool ? (salary/2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000