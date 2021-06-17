# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol depending on whether the triangle is a right,
# acute, obtuse, or invalid triangle

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if check_valid?(angles) == false
  return :right if angles.include?(90)
  return :acute if angles.all?{|ang| ang < 90}
  return :obtuse
end

def check_valid?(angles)  
  return false if angles.include?(0)
  angles[0] + angles[1] + angle[2] == 180
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid