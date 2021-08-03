# The reverse_sentence method should return a new string with the words of its arguments in reverse order, without using
# any of Ruby's built-in reverse methods. However, the code below raises an error. Change it so that it behaves as expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
=begin
Answer:
  The faulty code raised a TypeError on line 10. The code was failing because the line:
    reversed_words = words[i] + reversed_words
  was attempting to call the '+' method on the string value: 'words[i]' and combine it with an array: 'reversed_words'
Fix:
  Changed line to use Array#unshift to prepend each word to reversed_words.

=end