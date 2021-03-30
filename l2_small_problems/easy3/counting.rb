# counting.rb

=begin
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters.
Spaces should not be counted as characters.

Input = gets.chomp
splinput = Input.split(' ')
count = 0
splinput.each do x
  count += x.length
return desired output
=end

def getInput()
  puts "Please write 1 or more words"
  gets.chomp
end

def counting
  input = getInput
  input = input.split(' ')
  count = 0
  input.each do |x|
    count += x.length
  end
  puts "The count is #{count}"
end

counting