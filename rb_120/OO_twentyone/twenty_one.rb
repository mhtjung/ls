module Borders
  def initialize
    @h_border = "+" * 100
    @v_border = "+#{' ' * 98}+"
    super()
  end

  def spacer
    puts ''
  end

  def h_border
    puts @h_border
  end

  def v_border
    puts @v_border
  end

  def display_line(text)
    system('clear')
    puts @h_border
    puts @v_border
    puts @v_border
    puts content(text)
    puts @v_border
    puts @v_border
    puts @h_border
  end

  def content(text)
    "+#{text.center(98)}+"
  end

  def print_content(text)
    puts content(text)
  end
end

class Card
  SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds']
  VALUES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']

  attr_reader :name
  attr_accessor :value

  def initialize(value = VALUES.sample, suit = SUITS.sample)
    @name = value
    @value = convert(value)
    @suit = suit
  end

  def to_s
    "#{@name} of #{@suit}"
  end

  private

  def convert(value)
    case value
    when 'Ace' then 11
    when 'King', 'Queen', 'Jack' then 10
    else value
    end
  end
end

class Hand < Array
  def values
    map(&:value)
  end

  def names
    map(&:name)
  end

  def aces?
    names.include?('Ace')
  end

  def total
    until sum <= 21 || !values.include?(11)
      aces = self.select { |card| card.name == 'Ace' }
      aces.first.value = 1
    end
    sum
  end

  def blackjack?
    size == 2 && total == 21
  end

  private

  def sum
    values.sum
  end
end

class Deck
  def initialize
    @cards = create_deck
  end

  def deal
    @cards.shift
  end

  private

  def create_deck
    cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle
  end
end

class Player
  include Borders

  attr_accessor :hand, :name

  def initialize
    @hand = Hand.new
    super()
  end

  def show_hand
    cards = @hand.dup
    if @hand.size == 2
      "#{@name}'s hand: #{@hand[0]} and a #{@hand[1]}"
    else
      last_two = []
      2.times { |_| last_two.unshift(cards.pop) }
      last_two = last_two.join(' & ')
      cards << last_two
      "#{@name}'s hand: #{cards.join(', ')}"
    end
  end

  def hit(deck)
    @hand << deck.deal
  end

  def total
    hand.total
  end

  def busted?
    hand.total > 21
  end

  def discard_hand
    @hand = Hand.new
  end
end

class Human < Player
  include Borders

  def initialize
    @name = set_name
    super()
  end

  def turn(deck)
    choice = nil
    loop do
      choice = hit_or_stay
      break if choice == :s
      hit(deck) if choice == :h
      h_border
      print_content show_hand
      h_border
      break if busted?
    end
    unless busted?
      print_content("You stay!")
      sleep(1.5)
    end
  end

  private

  def set_name
    answer = nil
    loop do
      answer = gets.chomp
      break unless answer.empty?
      display_line "Sorry, invalid input!"
    end
    answer
  end

  def hit_or_stay
    answer = nil
    loop do
      puts "Would you like to hit or stay?"
      answer = gets.chomp
      break if ['h', 's'].include?(answer.downcase)
      puts "Sorry, invalid input"
    end
    answer.downcase.to_sym
  end
end

class Dealer < Player
  def initialize
    @name = self.class.to_s
    super()
  end

  def show_hand(symbol = nil)
    if symbol == :facedown
      "#{@name}'s hand: #{@hand[0]} and a facedown card."
    else
      super()
    end
  end

  def puts_hand(symbol = nil)
    spacer
    h_border
    print_content show_hand(symbol)
    h_border
  end

  def turn(deck)
    loop do
      break if @hand.total >= 17
      spacer
      puts "Dealer hits until 17!"
      hit(deck)
      sleep(1)
      puts_hand
      sleep(1)
      break if busted?
    end
    spacer
    puts "Dealer stays!" unless busted?
  end
end

class Game
  include Borders

  def initialize
    super()
  end

  def play
    initialization
    loop do
      game_logic
      break unless play_again?
    end
    goodbye_message
  end

  private

  def game_logic
    loop do
      deal_cards
      player_turns
      break
    end
    display_results
  end

  def initialization
    clear_screen
    greeting
    init_deck
    init_players
  end

  def clear_screen
    system('clear')
  end

  def greeting
    h_border
    v_border
    print_content("Welcome to Blackjack!")
    print_content("Please enter your name:")
    v_border
    h_border
  end

  def init_players
    @human = Human.new
    @dealer = Dealer.new
  end

  def init_deck
    @deck = Deck.new
  end

  def deal_cards
    reset_hands
    2.times { |_| @human.hit(@deck) }
    2.times { |_| @dealer.hit(@deck) }
  end

  def player_turns
    display_cards(:facedown)
    checking_bj_msg
    display_cards if blackjacks?
    return if blackjacks?
    @human.turn(@deck)
    display_cards
    @dealer.turn(@deck) unless @human.busted?
  end

  def display_cards(symbol = nil)
    clear_screen
    h_border
    v_border
    print_content(@dealer.show_hand(symbol))
    v_border
    print_content(@human.show_hand)
    v_border
    h_border
  end

  def blackjacks?
    @human.hand.blackjack? || @dealer.hand.blackjack?
  end

  def checking_bj_msg
    print 'Checking for blackjacks'
    sleep(0.4)
    print '.'
    sleep(0.4)
    print '.'
    sleep(0.4)
    puts '.'
    sleep(0.4)
  end

  def display_results
    blackjack_results
    busted_results if !blackjacks?
    total_results if !blackjacks?
    push_results
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, invalid input!"
    end
    answer == 'y'
  end

  def reset_hands
    @human.discard_hand
    @dealer.discard_hand
  end

  def blackjack_results
    puts "Dealer got a blackjack! You lose D:" if @dealer.hand.blackjack? &&
                                                  !@human.hand.blackjack?
    puts "You got a blackjack! Dealer loses! :D" if @human.hand.blackjack? &&
                                                    !@dealer.hand.blackjack?
  end

  def busted_results
    puts "You busted! Dealer wins!" if @human.busted?
    puts "Dealer busted! You win!" if @dealer.busted? && !@human.busted?
  end

  def total_results
    puts "Dealer wins!" if @dealer.total > @human.total && !@dealer.busted?
    puts "You win!" if @human.total > @dealer.total && !@human.busted?
  end

  def push_results
    puts "Push!" if @human.total == @dealer.total
  end

  def goodbye_message
    puts "Thanks for playing Blackjack!"
  end
end

twentyone = Game.new
twentyone.play
