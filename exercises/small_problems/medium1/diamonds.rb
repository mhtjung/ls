# Write a method that displays a 4-pointed diamond in an n x n grid where n
# is an odd integer that is supplied as an argument to the method. You may
# assume that the argument will always be an odd integer

def generate_stars(n, dist_from_cent)
  num = n - 2 * dist_from_cent
  stars = '*' * num
  puts stars.center(n)
end

def diamond(n)
  max_distance = (n - 1)/2
  max_distance.downto(0) {| x | generate_stars(n, x)}
  1.upto(max_distance)   {|x| generate_stars(n, x)}
end

diamond(9)