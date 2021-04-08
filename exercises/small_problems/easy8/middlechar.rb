# Used code from 'get middle word' challenge in Easy 7

def center_of(words)
  length = words.chars.length
  if length == 1
    return words
  elsif length.even?
    words.chars[(length/2)-1..(length/2)].join''
  else
    words.chars[(length/2)]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'