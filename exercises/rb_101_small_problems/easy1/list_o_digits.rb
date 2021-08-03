def digit_list(integer)
  integer.to_s.split("").map!{|x| x.to_i}  
end

a = digit_list(12345)
puts a