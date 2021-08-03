#Create method that converts the 'word' version of a number to the 'integer' version.

require 'pry'

NUM_WORDS = %w(zero one two three four five six seven eight nine)
NUMBERS = (0..9).to_a
LIBRARY = NUM_WORDS.zip(NUMBERS).to_h.freeze



def word_to_digit(text)    
  LIBRARY.keys.each do |word|
    text.gsub!(/\b#{word}\b/, LIBRARY)
  end
  text
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'