class GuessingGame
  def initialize(min = 0, max = 100)
    @possible_guesses = (min..max).to_a
  end
  
  def play
    init_objects
    loop do
     break if @guess_count == 0 || @player_guess == @correct_answer 
      guess_count_remaining
      get_guess
      display_results
      @guess_count -= 1
    end
    goodbye_message
  end

  private

  def init_objects
    @player_guess = nil
    @guess_count = set_guess_count
    @correct_answer = @possible_guesses.sample
  end

  def set_guess_count
    Math.log2(@possible_guesses.size).to_i + 1
  end

  def guess_count_remaining
    text = @guess_count == 1 ? 'guess' : 'guesses'
    puts "You have #{@guess_count} #{text} remaining."
  end

  def get_guess
    guess = nil
    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.chomp
      break if valid_guess?(guess)
      puts "Invalid input. Please try again."
    end
    @player_guess = guess.to_i
  end

  def valid_guess?(guess)
    (1..100).include?(guess.to_i)
  end

  def display_results
    puts "Holy shit you did it!" if @player_guess == @correct_answer
    puts "Your guess is too high." if @player_guess > @correct_answer
    puts "Your guess is too low." if @player_guess < @correct_answer
  end

  def goodbye_message
    puts "You're out of guesses. You lose :(" unless @player_guess == @correct_answer
    puts "Thanks for playing the Guessing Game!"
  end
end

game = GuessingGame.new
game.play

game.play