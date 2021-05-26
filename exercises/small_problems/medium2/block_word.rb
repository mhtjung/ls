require 'pry'

def block_word?(word)
  blocks = {'B'=>'O', 'X'=>'K', 'D'=>'Q', 'C'=>'P', 'N'=>'A', 'G'=>'T', 'R'=>'E',
            'F'=>'S', 'J'=>'W', 'H'=>'U', 'V'=>'I', 'L'=>'Y', 'Z'=>'M'}
  
  return false if word.size >= 13
  word.chars.each do |letter|
    if blocks.keys.include?(letter.upcase)
      blocks.keep_if { |k,v| k != letter }
    elsif blocks.values.include?(letter.upcase)
      blocks.keep_if { |k,v| v != letter } 
    else
      return false
    end
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
puts block_word?('supercalifragilisticexpialidocious') == false