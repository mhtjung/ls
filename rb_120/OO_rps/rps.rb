class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def add_move
    text = "#{self.name} chose #{self.move}"
    @history << text
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    self.add_move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2', '3PO', 'BB8'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.add_move
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def >(other_move)
    (rock? && (other_move.scissors?    || other_move.lizard?)) ||
      (paper? && (other_move.rock?     || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.paper?   || other_move.spock?)) ||
      (spock? && (other_move.scissors? || other_move.rock?))
  end

  def <(other_move)
    (rock? && (other_move.spock?      || other_move.paper?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.spock? || other_move.rock?)) ||
      (lizard? && (other_move.rock?    || other_move.scissors?)) ||
      (spock? && (other_move.lizard?   || other_move.paper?))
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def to_s
    @value
  end
end


class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_msg
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_msg
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      human.score += 1
      puts "#{human.name} won!"
    elsif human.move < computer.move
      computer.score += 1
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score(human, computer)
    puts "The score is #{human.name}: #{human.score} to #{computer.name}: #{computer.score}"
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, invalid input."
    end
    answer == 'y'
  end

  def play
    display_welcome_msg
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score(human, computer)
      display_goodbye_msg
      break unless play_again?
      break if human.score == 10 || computer.score == 10
    end
    puts @human.history
    puts @computer.history
  end
end

RPSGame.new.play
