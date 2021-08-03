require 'pry'

def rotate_array(arr)
  arr[1..-1].concat([arr[0]])
end

def rotate_rightmost_digits(x, y)
  numarr = x.to_s.chars
  rotated = rotate_array(numarr.slice!(-y,y))
  numarr.concat(rotated).join('').to_i
end

def max_rotation(number)
  digits = number.to_s.size
  digits.downto(2) do |n|
    binding.pry
    number = rotate_rightmost_digits(number, n)
  end
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
