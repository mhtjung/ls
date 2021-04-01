=begin
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers:
addition, subtraction, product, quotient, remainder, and power. DO NOT WORRY ABOUT VALIDATING THE INPUT
=end
require 'pry'

def arithmetic(x,y,operator)
  puts "#{x}#{operator}#{y} = #{eval(x+operator+y)}"
end

def get_nums
  puts "Please input two numbers!"
end

def arith_int
  operations = ['+','-','*','/','%','**']
  puts "Please input two numbers"
  x = gets.chomp
  y = gets.chomp
  operations.each do |operator|
    if ((operator == "/" || operator == "%")&& y == '0')
      puts "Whoops! Can't divide by 0!"
    else
      arithmetic(x,y,operator)
    end
  end
end

arith_int