# Write a method that takes a single String argument and returns a new string that contains the original value of the argument
# with the first character of every word capitalized and all other letters lowercase

def word_cap(string)
  result = []
  string.split(' ').each {|x| result << x.downcase}
  result.each {|x| x[0] = x[0].upcase}.join(' ')
end



puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'