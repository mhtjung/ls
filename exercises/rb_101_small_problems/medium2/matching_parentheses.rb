# Write a method that takes a string as an argument, and returns true if
  # all parentheses in the string are properly balanced
  # false otherwise

def balanced?(text)
  open_par = text.chars.count { |char| char =~ /\(/}
  close_par = text.chars.count { |char| char =~ /\)/}
  open_par == close_par
end
=begin
puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
=end
def bad_balanced?(text)
  parens = 0
  bracks = 0
  curls = 0
  text.chars.each do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    bracks += 1 if char == '['
    bracks -= 1 if char == ']'
    curls += 1  if char == '{'
    curls -= 1  if char == '}' 
    break if parens < 0 || bracks < 0 || curls < 0
  end
  squotes = text.chars.count { |char| char == '\''}
  dquotes = text.chars.count { |char| char == '\"'}
  parens.zero? && bracks.zero? && curls.zero? &&
  squotes.even? && dquotes.even?
end

def balanced?(text, o_char, c_char)
  count = 0
  text.chars.each do |char|
    count += 1 if char == o_char
    count -= 1 if char == c_char
    break if count < 0
  end

  count.zero?
end

def check_balance(text, chars)
  result = {}
  chars.each do |o_char, c_char|
    result[o_char] = balanced?(text, o_char, c_char)
  end

  result
end

chars = [['(',')'], ['[',']'], ['{','}']]
puts check_balance("This is the second '' balanced test """, chars)
=begin
puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('This is a test }') == false
puts balanced?('This {is a nother} test []') == true
puts balanced?('One more} test[]') == false
puts balanced?("This is a test to see ' if it catches quotes") == false
puts balanced?("This is the second '' balanced test """) == true
=end