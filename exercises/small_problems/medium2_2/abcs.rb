# Write a method that returns true if the word passed in as an argument
# can be spelled from this set of blocks.

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  BLOCKS.none? { |block| string.upcase.count(block) >= 2}
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true