# Given the array 

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order.
# Your output should look something like this:

def anagrams(arr)
  result = []
  arr.each do |word|
    temp = []
    arr.each do |checkword|
      temp << checkword if word.chars.sort == checkword.chars.sort
    end
    result << temp
  end
  result.uniq
end

p anagrams(words)