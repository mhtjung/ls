
def isdouble?(int)
  num_str = int.to_s
  if num_str.size.even?
    return true if num_str[0..(num_str.size/2)-1] == num_str[(num_str.size/2)..]
  end
  false
end

def twice(int)
  if isdouble?(int)
    return int
  else
    return int * 2
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10

