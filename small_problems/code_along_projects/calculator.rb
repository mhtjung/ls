=begin
'Bonus Features' Added:
1. Better integer validation
  - Opted for using Regex to validate input
=end


def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  /^-?\d+$/.match(num)
end

def operation_to_message(x)
  case x
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt 'Welcome to my calculator! Enter your name: '

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi #{name}"

loop do # main loop
  num1 = ''
  num2 = ''
  loop do
    prompt 'Please input the first of two numbers'
    num1 = gets.chomp.to_i
    if valid_number?(num1)
      break
    else
      prompt 'Invalid input! Try again.'
    end
  end
  loop do
    prompt 'Please enter the second number'
    num2 = gets.chomp.to_i
    if valid_number?(num2)
      break
    else
      prompt 'Invalid input! Try again.'
    end
  end
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG
  prompt operator_prompt
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end
  prompt "#{operation_to_message(operator)} the two numbers..."
  answer =
    case operator
    when '1'
      num1 + num2
    when '2'
      num1 - num2
    when '3'
      num1 * num2
    when '4'
      num1.to_f / num2.to_f
    end
  prompt "The result is #{answer}."
  prompt "Do you want to perform another operation? (y/n)"
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt "Thanks for stopping by!"