=begin
'Bonus Features' Added:
1. Better integer validation
  - Opted for using Regex to validate input

2. Number validation
  - Created a number? method to test if a number is an integer or float and create a 
    more robust validation method

3. Case Stamenet 
  - Edited the case statement to save the resulting string to a variable, allowing me
    to input additional logic/code before/after the case statement
  
4. Config File
  - Added a .yml config file to for easier editing and a 'cleaner' visual presentation

5. Added multi-language compatability 
=end
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts("=> #{message}")
end

def integer?(num)
  /^-?\d+$/.match(num)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(x)
  word = case x
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
    word
end

prompt messages('welcome','es')

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt messages('valid_name','es')
  else
    break
  end
end

prompt "Hi #{name}"

loop do # main loop
  num1 = ''
  num2 = ''
  loop do
    prompt messages('first_num')
    num1 = gets.chomp
    if number?(num1)
      break
    else
      prompt messages('valid_num')
    end
  end
  loop do
    prompt messages('second_num')
    num2 = gets.chomp
    if number?(num2)
      break
    else
      prompt messages('valid_num')
    end
  end
  prompt messages('operator_prompt') 
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages('valid_operator')
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
  prompt messages('again')
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt messages('bye')