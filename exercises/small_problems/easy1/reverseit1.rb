#write a method that takes a string and returns it with the words in reverse order

def reverse(sentence)
  sentence.split(' ').reverse.join(' ')
end

puts reverse('Reverse these words')