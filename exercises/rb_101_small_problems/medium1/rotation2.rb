# Write a method that can rotate the last n digits of a number. For example: 


def rotate_array(arr)
  arr[1..-1].concat([arr[0]])
end

def rotate_rightmost_digits(x, y)
  numarr = x.to_s.chars
  rotated = rotate_array(numarr.slice!(-y,y))
  numarr.concat(rotated).join('').to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917