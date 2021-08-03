#write a method that takes a string of words and returns
#the given string with word.length>5 reversed

def reverse(string)
  arr = string.split
  arr.each do |x|
    x.reverse! if x.length > 5
  end
  return arr.join' ' 
end

test1 = 'This is a superduper test'

puts reverse(test1)