# Write a method that displays an 8-pointed star in an 'n'x'n' grid
# where 'n' is an odd integer that is supplied as an argument to the
# method. The smallest such star you need to handle is a 7x7 grid.


# 1. Define center line
# 2. Identify whitespace requirements for other lines

def generate_row(n, dist_from_cent)
  num_of_spaces = dist_from_cent - 1
  spaces = ' ' * num_of_spaces
  result = Array.new(3, '*').join(spaces)
  puts result.center(n)
end

def stars(number)
  max_dist = (number - 1)/2
  max_dist.downto(1) { |dist| generate_row(number, dist)}
  puts '*' * number
  1.upto(max_dist) { |dist| generate_row(number, dist)}
end

stars(9)
stars(25)
