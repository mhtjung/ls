# We wrote a neutralize method that removes negative words from setnences. However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  words.keep_if { |word| negative?(word) == false}
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

=begin
Answer: This fails because the on line 6, the author is attempting to modify an enumerable while iterating over it. This causes words.each to skip
the word 'boring', because its index position has now changed, due to words.delete(word).

Fix:
Changed code to use Array#keep_if 
=end