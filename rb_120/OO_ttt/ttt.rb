require 'pry'

module AI
  WINNING_LINES = [[0, 1, 2],
                   [3, 4, 5],
                   [6, 7, 8],
                   [0, 3, 6],
                   [1, 4, 7],
                   [2, 5, 8],
                   [0, 4, 8],
                   [2, 4, 6]]

  def smart_choice(board)
    choice = imminent_win_loss(board)
    return choice if choice
    return 4 if board.grid[4].empty?
    board.empty_sqrs.sample
  end

  def imminent_win_loss(board)
    grid = board.grid
    choice = detect_win(grid)
    return choice if choice
    choice = detect_danger(grid)
    return choice if choice
    nil
  end

  def detect_danger(grid)
    WINNING_LINES.each do |line| # take winning line
      sqrs = convert_to_squares(line, grid) # convert to arr of squares
      return sqrs.select(&:empty?).first.position - 1 if potential_danger?(sqrs)
    end
    nil
  end

  def detect_win(grid)
    WINNING_LINES.each do |line| # take winning line
      sqrs = convert_to_squares(line, grid) # convert to arr of squares
      return sqrs.select(&:empty?).first.position - 1 if potential_win?(sqrs)
    end
    nil
  end

  def convert_to_squares(line, grid)
    squares = []
    line.each do |index|
      squares << grid[index]
    end
    squares
  end

  def potential_danger?(squares)
    squares.count(&:empty?) == 1 &&
      squares.count { |sq| (sq.mark != @mark) && (!sq.empty?) } == 2
  end

  def potential_win?(squares)
    squares.count(&:empty?) == 1 &&
      squares.count { |sq| (sq.mark == @mark) } == 2
  end
end

class Board
  attr_accessor :grid

  def initialize
    @grid = (1..9).to_a.map { |position| Square.new(position) }
  end

  def empty_sqrs
    blank_squares
  end

  def empty_sqrs_str
    squares = blank_squares.map { |idx| idx + 1 }
    return squares.first if squares.size == 1
    return squares.join(' & ') if squares.size == 2
    last_two = []
    2.times { last_two.unshift(squares.pop) }
    last_two = last_two.join(' or ')
    squares << last_two
    squares.join(', ')
  end

  def full?
    blank_squares.empty?
  end

  def reset
    @grid = (1..9).to_a.map { |position| Square.new(position) }
  end

  def display_board
    clear_screen
    display_grid
  end

  def check_win?(player)
    mark = player.mark
    horizontal_wins?(mark) ||
      vertical_wins?(mark) ||
      diagonal_wins?(mark)
  end

  private

  def horizontal_wins?(mark)
    [0, 1, 2].all? { |x| grid[x].mark == mark } ||
      [3, 4, 5].all? { |x| grid[x].mark == mark } ||
      [6, 7, 8].all? { |x| grid[x].mark == mark }
  end

  def vertical_wins?(mark)
    [0, 3, 6].all? { |x| grid[x].mark == mark } ||
      [1, 4, 7].all? { |x| grid[x].mark == mark } ||
      [2, 5, 8].all? { |x| grid[x].mark == mark }
  end

  def diagonal_wins?(mark)
    [0, 4, 8].all? { |x| grid[x].mark == mark } ||
      [2, 4, 6].all? { |x| grid[x].mark == mark }
  end

  def clear_screen
    system('clear')
  end

  def display_grid
    grid_top
    puts "#{@grid[0]}|#{@grid[1]}|#{@grid[2]}"
    grid_top_mid
    puts "#{@grid[3]}|#{@grid[4]}|#{@grid[5]}"
    grid_bot_mid
    puts "#{@grid[6]}|#{@grid[7]}|#{@grid[8]}"
    grid_bot
  end

  def grid_top
    puts ""
    puts "     |     |     "
  end

  def grid_top_mid
    puts "     |     |     "
    puts "-----|-----|-----"
    puts "     |     |     "
  end

  def grid_bot_mid
    puts "     |     |     "
    puts "-----|-----|-----"
    puts "     |     |     "
  end

  def grid_bot
    puts "     |     |     "
  end

  def blank_squares
    result = []
    grid.each_index do |idx|
      result << idx if grid[idx].empty?
    end
    result
  end
end

class Square
  attr_accessor :mark
  attr_reader :position

  def initialize(position)
    @mark = ''
    @position = position
  end

  def to_s
    mark.upcase.center(5)
  end

  def empty?
    mark.empty?
  end
end

class Player
  attr_accessor :mark, :name, :score

  @@marks = ['x', 'o']

  def initialize
    @score = 0
  end

  def to_s
    @name
  end
end

class Human < Player
  attr_reader :mark

  def initialize
    @name = set_name
    @mark = set_mark
    super()
  end

  def move(board)
    choice = nil
    loop do
      puts "Please choose an empty square: #{board.empty_sqrs_str}"
      choice = gets.chomp.to_i
      break if board.empty_sqrs.include?(choice - 1)
      puts "Incorrect choice - please try again!"
    end
    square = board.grid[choice.to_i - 1]
    square.mark = @mark
    board.display_board
  end

  private

  def set_name
    answer = nil
    loop do
      puts "Please enter your name!"
      answer = gets.chomp
      break if !answer.empty?
    end
    answer
  end

  def set_mark
    answer = nil
    loop do
      puts "What would you like your marker to be?"
      answer = gets.chomp
      break if answer.size <= 5
      puts "Sorry, invalid input. Please try again!"
    end
    @@marks.reject! { |x| x == answer.downcase }
    answer
  end
end

class Computer < Player
  include AI

  def initialize
    @name = ['R2-D2', 'Hal', 'C-3PO', 'The Ghost of Alan Turing'].sample
    @mark = @@marks.first
    super()
  end

  def move(board)
    grid = board.grid
    choice = smart_choice(board)
    square = grid[choice]
    square.mark = @mark
    board.display_board
  end
end

class TTTgame
  def initialize
    @board = Board.new
  end

  def play
    display_welcome_msg
    init_players
    loop do
      player_turns
      display_results
      break unless play_again?
      board.reset
    end
    display_goodbye_msg
  end

  private

  attr_accessor :board, :human, :computer

  def player_turns
    loop do
      board.display_board
      human.move(@board)
      break if board.check_win?(human) || board.full?
      computer.move(@board)
      break if board.check_win?(computer) || board.full?
    end
  end

  def play_again?
    return false if human.score >= 5 || computer.score >= 5
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry - that's not a valid input!"
    end
    answer.downcase == 'y'
  end

  def display_score
    h_score = human.score
    c_score = computer.score
    puts "The score is #{@human}: #{h_score} to #{@computer}: #{c_score}"
  end

  def display_results
    if board.check_win?(@human)
      human.score += 1
      puts "#{human.name} wins!"
    elsif board.check_win?(@computer)
      computer.score += 1
      puts "#{computer.name} wins!"
    else
      puts "Cat's game!"
    end
    display_score
  end

  def display_welcome_msg
    puts "Welcome to Tic Tac Toe!"
  end

  def display_goodbye_msg
    puts "Thanks for playing Tic Tac Toe"
  end

  def init_players
    @human = Human.new
    @computer = Computer.new
  end
end

game = TTTgame.new
game.play
