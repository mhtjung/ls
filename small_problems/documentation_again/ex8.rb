#instructions were unclear - the message at the top of the page instructs me to follow along using the 2.3.0 documentation; however, it also asks 
#me to identify a method and its relevant documentation (Array#min) that were introduced in 2.4.0. I checked through the 2.3.0 documentation for 
#the Array class, as well as its superclass, Object, and that class's respective superclass BasicObject - I could not find references to a #min or a #minimum method

#for simplicit's sake, I wrote two solutions - one uses Array#min, the other does not

a = [5, 9, 3, 11]
puts a.min(2)

def without_min(arr)
  arr.sort!
  return arr[0..1]
end

puts without_min(a) == [3,5]