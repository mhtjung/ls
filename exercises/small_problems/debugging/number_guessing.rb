=begin
A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1
and a provide maximum number and offers you a given number of attempts to guess it.

However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior.
Can you figure out what is wrong?
=end

require 'pry'


def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i
    binding.pry
    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      #guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)

=begin
The issue was on line 40 - the program attempted to recursively call itself; however, the function didn't return itself, meaning it created an
infinite number of game loops in which the winning number was always different and attempts was always reset to 0.
=end