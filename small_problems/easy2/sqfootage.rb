def sqft
  puts 'Please enter the dimensions of the room in meters'
  a = gets.chomp.to_i
  puts "#{a}m x ..."
  b = gets.chomp.to_i
  puts "#{a}m x #{b}m"
  puts "The area of the room is #{a*b} square meters and #{a*b*10.7639} square feet"
end

sqft