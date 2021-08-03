# Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the words
# 'zero','one'.....'nine' converted to a string of digits.

require 'pry'

DIGIT_WORDS = %w(zero one two three four five six seven eight nine)
DIGIT_NUMS = (0..9).to_a
DIGITS = DIGIT_WORDS.zip(DIGIT_NUMS).to_h  
SEARCH = /zero|one|two|three|four|five|six|seven|eight|nine|/


def word_to_digit(string)
  numbers = ''
  string.downcase!.gsub!(/zero|one|two|three|four|five|six|seven|eight|nine/,DIGITS)
  string.chars.each do |char|
    numbers << char if int_check(char)
  end
  string.gsub!(/\d.*\d/, convert_phone(numbers))
  string = string.split('.').map {|sent| sent.lstrip.capitalize + '.'} 
  string.join(' ')
end

def int_check(char)
  char.to_i.to_s == char
end

def convert_phone(num_str)
  if num_str.size == 10
    num_str = "(#{num_str[0,3]}) #{num_str[3,3]}-#{num_str[6,4]}"
  else
    num_str
  end
end

puts word_to_digit('Please call me at Seven Six Five five five one two three four four. Thanks. If that doesnt work, try my office')
