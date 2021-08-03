CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = []
  string.chars.each do |x|
    if CONSONANTS.include?(x.downcase)
      result << x*2
    elsif
      result << x
    end
  end
  result.join('')
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""