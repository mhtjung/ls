# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol
  # :right, :acute, :obtuse, or invalid
  # :right - one angle is 90
  # :acute - all angles are less than 90
  # :obtuse - 1 angle is greater than 90 degrees


def valid_triangle?(angles)
  return false if angles.include?(0)
  angles.sum == 180
end

def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  if valid_triangle?(angles)
    return :right if angles.include?(90)
    return :acute if angles.all? {|ang| ang < 90}
    return :obtuse
  end
  return :invalid
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid