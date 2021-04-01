# letterswap.rb

# Given a string of words separated by spaces, write a method that takes this tring of words and returns a string in which the first and last letters of every word are swapped

def swap(str)
  arr = str.split(' ')
  new_arr = arr.map {|x| reverse_letters(x)}
  new_arr.join(' ')
end

def reverse_letters(word)
  chars = word.chars
  if chars.length > 2
    first_letter = chars.shift
    last_letter = chars.pop
    chars.push(first_letter)
    chars.unshift(last_letter)
    chars.join('')
  elsif chars.length == 2
    chars.reverse.join('')
  else
    chars.join('')
  end
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'