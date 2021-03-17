#ask the use for two numbers
#ask the user for an operation to perform
#perform the operation on the two numbers
#output the result

loop do
  puts 'Welcome to my calculator - please input the first of two numbers'
  num1=gets.chomp.to_i
  puts 'Please enter the second number'
  num2=gets.chomp.to_i
  puts "Please enter the operation you'd like to perform (+,-,*,/)"
  operator = gets.chomp
  case operator
  when "+"
    answer = num1 + num2
    break
  when "-"
    answer = num1-num2
    break
  when "*"
    answer = num1*num2
    break
  when "/"
    answer = num1/num2
    break
  else
    puts "Invalid operation"
  end
end

puts "The result is #{answer}."