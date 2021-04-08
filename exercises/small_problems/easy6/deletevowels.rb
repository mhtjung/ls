# WRite a method that takes an array of strings, and returns an array of the same string values, except with the vowels removed

VOWELS = %w(A E I O U)

def remove_vowels(arr)
  new_arr = []
  arr.each do |word|
    new_arr << word.chars.reject{|letter| VOWELS.include?(letter.upcase)}.join('')
  end
  new_arr
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']