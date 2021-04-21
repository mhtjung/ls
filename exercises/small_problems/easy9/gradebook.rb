# Write a method that deteremines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade

def get_grade(a, b, c)
  arr = [a, b, c]
  avg = arr.sum/arr.size

  case avg
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  when 50-59 then 'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"

  
  