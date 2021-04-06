# Create a method that takes a string and returns a string with each word capitalized.

def titleize(string)
  string.split(' ').each {|x| x.capitalize!}.join(' ')
end

words = "the flintstones rock"

puts titleize words