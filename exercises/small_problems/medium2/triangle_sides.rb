# Write a method that takes the lenghts of the 3 sides of a triangle as arguments, and returns a symbol

def triangle(side1, side2, side3)
  return :invalid if valid_trongle?([side1, side2, side3]) == false
  return :equilateral if side1 == side2 && side2 == side3
  return :isosceles if side1 == side2 || side1 == side3 || side2 == side3 
  :scalene
end

def valid_trongle?(sides)
  sorted = sides.sort
  longest = sorted.pop
  sorted.sum > longest
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid