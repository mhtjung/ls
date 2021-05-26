# Make a madlibs program that reads in some text from a text file that you have created
# and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs
# into that text and prints it. You can build your lists of nouns, verbs, adjectives, and
# adverbs directly into your program, but the text data should come from a file or other
# external source. Your program should read this text, and for each line, it should place
# random words of the appropriate types into the text, and print the result.


# Use array of hashes that use the value of each hash to store a list of particular words
  # example: wordbank[:adjective].sample

# Create regex pattern to recognize open and close tags
  # example: %{adjective}

# Iterate through words in program
  # if regex pattern generates a match-object
    # replace the tags with wordbank[:adjective].sample
require 'pry'

def mad_tags(text)
  text.match(/\%\{.*\}/)
end

# SHUFFLE WORD BANK TO START
wordbank = {
  :adjectives => ['quick','lazy','sleepy','ugly'],
  :nouns      => ['fox','dog','head','leg'],
  :verbs      => ['jumps','lifts','bites','licks'],
  :adverbs    => ['easily','lazily','noisily','excitedly']
}

text =  "The %{adjective} brown %{noun} %{adverb}."#File.open(text_data.txt)

words = text.split(" ")
new_text = []
words.each do |word|
  if mad_tags(word) == nil
    new_text << word
  else
    #binding.pry
    case mad_tags(word)[0]
    when "%{adjective}"
      new_text << wordbank[:adjectives].pop
    when "%{noun}"
      new_text << wordbank[:nouns].pop
    when "%{verb}"
      new_text << wordbank[:verbs].pop
    when "%{adverb}"
      new_text << wordbank[:adverbs].pop
    end
  end
end

     
puts new_text