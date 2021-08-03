DIGITS = ['0','1','2','3','4','5','6','7','8','9','10']

def integer_to_string(num)
  result = ''
  loop do  
    num, remainder = num.divmod(10)
    result = DIGITS[remainder] + result
    break if num == 0
  end
  result
end

def signed_integer_to_string(num)
  if num > 0
    return '+' + integer_to_string(num)
  elsif num < 0
    return '-' + integer_to_string(-num)
  else
    return '0'
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'