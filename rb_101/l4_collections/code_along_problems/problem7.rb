statement = "The Flintstones Rock"
count_arr = []
statement.chars.each do |x|
  count_arr << [x,statement.chars.count(x)]
end

count_hash = count_arr.to_h
puts count_hash