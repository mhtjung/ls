# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol
# depending on the resulting valid or invalid triangle.

def triangle(side1, side2, side3)
  return :invalid if check_valid?(side1, side2, side3) == false
  return :equilateral if side1 == side2 && side1 == side3
  return :isosceles if side1 == side2 || side2 == side3 || side1 == side3
  return :scalene
end

def check_valid?(side1, side2, side3)
  sides = [side1, side2, side3]
  return false if sides.include?(0)
  longest_side = sides.sort!.pop
  sides.sum > longest_side
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid