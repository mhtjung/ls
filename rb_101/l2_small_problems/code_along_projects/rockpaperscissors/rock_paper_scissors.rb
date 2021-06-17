# TODO: Need to add a better way for users to choose input (instead of typing the full word out)

VALID_CHOICES = %w(rock paper scissors lizard spock)

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Its a tie!")
  end
end

def prompt(message)
  puts("=> #{message}")
end
player_score = 0
computer_score = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample
  puts("You chose: #{choice}. The Computer chose: #{computer_choice}")
  display_result(choice, computer_choice)
  if win?(choice, computer_choice)
    player_score +=1
    prompt("The score is You: #{player_score} - CPU: #{computer_score}")
  elsif win?(computer_choice, choice)
    computer_score +=1
    prompt("The score is You: #{player_score} - CPU: #{computer_score}")
  end

  if player_score == 5
    prompt("You are the grand winner!")
    prompt("Thanks!")
    break
  elsif computer_score == 5
    prompt("The Computer is the grand winner!")
    prompt("Better luck next time!")
    break
  end
  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing. Peace!")

=begin
Things to consider
1. Yes, the method still works.
2. The first instance does not work, because test_method is
    called before the prompt method. The example does work,
    because prompt has been defined before the method call.
3. If display_result returned a string, you could simply prepend
   "puts" onto the existing code
4. We can use the valid choices constant. Instead of hardcoding
   'scissors beats rock', we could write logic that checks if
   player 2 choice is one index position behind the player 1s. (A win condition)
  
   something like:
  player_choice = gets.chomp
  player2_choice = gets.chomp
  if CONSTANTS.index(player_choice) == CONSTANTS.index(player2_choice)
    return "Tie"
  elsif CONSTANTS.index(player_choice) == CONSTANTS.index(player2_choice)+1
    return "Win"
  else
    return "Loss"
=end
