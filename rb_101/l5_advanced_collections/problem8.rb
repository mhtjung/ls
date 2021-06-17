# Using the each method, write some code to output all of the vowels from the strings

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(A E I O U)

hsh.each do |key, values|
  values.each do |word|
    word.chars.each do |char|
      if VOWELS.include?(char.upcase)
        puts char
      end
    end
  end
end
