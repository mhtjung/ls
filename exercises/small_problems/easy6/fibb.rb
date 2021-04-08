def find_fibonacci_index_by_length(num_o_digits)
  f_num = 1
  s_num = 1
  index = 2

  loop do 
    index +=1
    fibonacci = f_num + s_num
    if fibonacci.to_s.length >= num_o_digits
      break
    else
      f_num = s_num
      s_num = fibonacci
    end
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847