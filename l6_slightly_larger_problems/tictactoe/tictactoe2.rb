require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
[[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
[[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd,player_score = 0,computer_score = 0)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts display_score(player_score, computer_score)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr,delimiter = ', ',word = 'or')
  if arr.size == 1
    return arr[0].to_i
  elsif arr.size == 2
    return arr.join(" #{word} ")
  elsif arr.size > 2
    arr[-1] = "#{word} #{arr.last}"
    return arr.join(delimiter)
  end
end

def place_piece!(brd, current_player)
  if current_player == 'human'
    player_move!(brd)
  else
    computer_move!(brd)
  end
end


def player_move!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})."
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = computer_defense(line, brd)
    break if square
  end
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def computer_defense(line,brd)
  #binding.pry
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  elsif brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  elsif brd[5] == INITIAL_MARKER
    5
  else
    nil
  end

end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_score(player_score,computer_score)
  "The score is Player: #{player_score} to Computer: #{computer_score}"
end

def alternate_player(current_player)
  if current_player == 'human'
    'computer'
  else
    'human'
  end
end

def whofirst
  prompt "Who should go first? 1 for you, 2 for the computer"
  answer = gets.chomp.to_i
  current_player = nil
  if answer == 1
    current_player = 'human'
  else
    current_player = 'computer'
  end
  computer_override(current_player)
end

def computer_override(current_player)
  override = [true,false].sample
  if override
    answer = [0,1].sample
    if answer == 0
      current_player = 'human'
    else
      current_player = 'computer'
    end
  end
  [current_player, override]
end


def play_game()
  player_wins = 0
  computer_wins = 0
  loop do
    board = initialize_board
    current_player = whofirst
    loop do
      display_board(board, player_wins, computer_wins)
      place_piece!(board,current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || board_full?(board)
    end

    display_board(board,player_wins,computer_wins)

    if winner?(board)
      if detect_winner(board) == 'Player'
        player_wins += 1
        display_board(board,player_wins,computer_wins)
        prompt "#{detect_winner(board)} won!"
        prompt display_score(player_wins,computer_wins) 
      elsif detect_winner(board) == 'Computer'
        computer_wins += 1
        display_board(board,player_wins,computer_wins)
        prompt "#{detect_winner(board)} won!"
        prompt "The score is Player: #{player_wins} to Computer: #{computer_wins}"
      end
    else
      prompt "Cat's Game!"
      prompt "The score is Player: #{player_wins} to Computer: #{computer_wins}"
    end
    if player_wins >= 5
      prompt "You are the ultimate winner!"
      break
    elsif computer_wins >= 5
      prompt "MACHINE TRIUMPS OVER FLESH ONCE AGAIN"
      break
    else
      prompt "Wanna play again? (y or n)"
      answer = gets.chomp
      break unless answer.downcase.start_with?('y')
    end
  end

  prompt "Thanks for playing!"
end

play_game