# Write a method that displays a 4-pointed diamond in an n x n grid where n
# is an odd integer that is supplied as an argument to the method. You may
# assume that the argument will always be an odd integer


def generate_row(grid_size, dist_from_cent)
  num_of_spaces = dist_from_cent - 1
  spaces = ' ' * num_of_spaces
  result = Array.new(3, '*').join(spaces)
  puts result.center(grid_size)
end

def stars(number)
  max_dist = (number - 1) / 2
  max_dist.downto(1) { |dist| generate_row(number, dist)}
end