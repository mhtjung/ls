require 'pry'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class StackEmptyError < MinilangError; end

class Minilang
  VALID_COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(commands)
    @commands = commands.split(' ')
    @register = 0
    @stack = Array.new
    raise BadTokenError.new('Invalid commands detected') unless valid_commands?
  end

  def eval
    execute_commands
  end

  private

  def execute_commands
    @commands.each do |command|
      case command
      when 'PUSH' then @stack.push(@register)
      when 'ADD'  then @register += stack.pop
      when 'SUB'  then @register -= stack.pop
      when 'MULT' then @register *= stack.pop
      when 'DIV'  then @register /= stack.pop
      when 'MOD'  then @register %= stack.pop
      when 'POP'  then @register = stack.pop
      when 'PRINT' then p @register.to_i
      else 
        @register = command.to_i
      end
    end
  end

  def valid_commands?
    @commands.all? do |command|
      VALID_COMMANDS.include?(command) || command.match?(/\A[-+]?\d+\z/)
    end
  end

  def stack
    stack_empty_check
    @stack
  end

  def stack_empty_check
    raise StackEmptyError.new('Stack is empty!') if @stack.empty?
  end
end

Minilang.new('PRINT')
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)