# Write a method that implements a miniature stack-and-register based programming language that has the following commands:
require 'pry'

def minilang(commands)
  stack = []
  register = 0
  commands = commands.split.each {|x| x.upcase!}
  commands.each do |command|
    #binding.pry
    begin
      case command
      when 'PUSH' then stack.push(register)
      when 'ADD' then register += stack.pop
      when 'SUB' then register -= stack.pop
      when 'MULT' then register *= stack.pop
      when 'DIV' then register /= stack.pop
      when 'MOD' then register %= stack.pop
      when 'POP' then register = stack.pop
      when 'PRINT' then p register
      else 
        if command.to_i.to_s == command 
          register = command.to_i 
        else
          puts "ERROR: Command not recognized"
        end
      end
    rescue ZeroDivisionError => e
      puts "Exception Class: #{ e.class.name }"
      puts "Exception Message: #{ e.message }"
      puts "Exception Backtrace: #{ e.backtrace }"
    rescue TypeError => e
      puts "Exception Class: #{ e.class.name }"
      puts "Exception Message: #{ e.message }"
      puts "Exception Backtrace: #{ e.backtrace }"
    end
  end
end

command2 = "3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT"
command3 = "POP PRINT"
minilang(command2)
minilang(command3)