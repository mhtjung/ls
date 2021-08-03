# lettercounter.rb

def word_sizes(text)
  result = []
  lengths = text.split(' ').map {|x| x.delete('^A-Za-z').size}
  lengths.each {|x| result << [x, lengths.count(x)]}
  result.to_h
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}