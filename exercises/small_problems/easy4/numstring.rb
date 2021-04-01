
def digit_hash
  num_str = ('0'..'10').to_a
  num_int = (0..10).to_a
  num_str.zip(num_int).to_h
end

DIGITS = digit_hash

def arr_to_num(arr, positive = true)
  if positive == true
    if DIGITS.values.include?(arr[0])
      total = 0
      arr.each {|x| total = total * 10 + x}
      total
    else
      total = 0
      arr.shift
      arr.each {|x| total = total * 10 + x}
      total
    end
  elsif positive == false
    total = 0
    arr.shift
    arr.each {|x| total = total * 10 + x}
    -total
  end
end

def str_to_int(num_string)
  positive = true
  positive = false if num_string[0] == '-'
  arr_to_num(num_string.chars.map{|x| DIGITS[x]}, positive)
end

puts str_to_int('4321') == 4321
puts str_to_int('-570') == -570
puts str_to_int('+100') == 100