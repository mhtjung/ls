module Borders
  def spacer
    puts ''
  end

  def h_border
    puts "+" * 100
  end

  def v_border
    puts "+#{' ' * 98}+"
  end

  def display_line(text)
    h_border
    v_border
    print_content(text)
    v_border
    h_border
  end

  def print_content(text)
    puts "+#{text.center(98)}+"
  end

  def content(text)
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
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def <<(card)
    @cards << card
  end

  def values
    @cards.map(&:value)
  end

  def names
    @cards.map(&:name)
  end

  def aces?
    names.include?('Ace')
  end

  def total
    until sum <= 21 || !values.include?(11)
      aces = @cards.select { |card| card.name == 'Ace' }
      aces.first.value = 1
    end
    sum
  end

  def blackjack?
    @cards.size == 2 && total == 21
  end

  def size
    @cards.size
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

  def reset!
    @cards = create_deck
  end
end

class Player
  attr_accessor :hand, :name

  def initialize
    @hand = Hand.new
  end

  def show_hand
    cards = @hand.cards.dup
    if @hand.size == 2
      "#{@name}'s hand: #{@hand.cards[0]} and a #{@hand.cards[1]}"
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

  def reset_hand
    @hand = Hand.new
  end
end

class Human < Player
  include Borders

  def initialize
    @name = nil
    super()
  end

  def hit?
    answer = nil
    loop do
      puts "Would you like to hit or stay?"
      answer = gets.chomp
      break if ['h', 's'].include?(answer.downcase)
      puts "Sorry, invalid input"
    end
    answer.downcase == 'h'
  end

  def set_name
    answer = nil
    loop do
      answer = gets.chomp
      break unless answer.empty?
      puts "Sorry, invalid input! Please enter your name:"
    end
    @name = answer
  end
end

class Dealer < Player
  LIMIT = 17 # Dealer hits until hand total == LIMIT

  def initialize
    @name = self.class.to_s
    super()
  end

  def show_hand(symbol = nil)
    if symbol == :facedown
      "#{@name}'s hand: #{@hand.cards[0]} and a facedown card."
    else
      super()
    end
  end
end

class Game
  include Borders

  def test
    h_border
    v_border
    print_content "Why the fuck does this work?"
    v_border
    h_border
  end

  def initialize
    @deck = Deck.new
    @human = Human.new
    @dealer = Dealer.new
  end

  def play
    clear_screen
    greeting
    @human.set_name
    loop do
      turn_logic
      display_results
      break unless play_again?
    end
    goodbye_message
  end

  private

  def turn_logic
    loop do
      initial_deal
      break if blackjacks?
      player_turns
      break
    end
  end

  def initial_deal
    deal_cards
    display_cards(:facedown)
    checking_bj_msg
    display_cards if blackjacks?
  end

  def dealer_turn
    dealer_turn_messages
    until @dealer.total >= Dealer::LIMIT
      puts "Dealer hits until 17!"
      sleep(0.75)
      puts "Dealer hits!"
      sleep(0.75)
      @dealer.hit(@deck)
      display_cards
      break if @dealer.busted?
    end
  end

  def dealer_turn_messages
    puts "Dealers turn!"
    sleep(1)
    display_cards
    display_line "Dealer stands on 17!" if @dealer.total >= Dealer::LIMIT
  end

  def human_turn
    loop do
      break unless @human.hit?
      @human.hit(@deck)
      display_cards(:facedown)
      break if @human.busted?
    end
    display_line "You stay!" unless @human.busted?
    sleep(1)
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

  def deal_cards
    reset_hands
    2.times { |_| @human.hit(@deck) }
    2.times { |_| @dealer.hit(@deck) }
  end

  def player_turns
    human_turn
    dealer_turn unless @human.busted?
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
    interval = 0.2
    print 'Checking for blackjacks'
    sleep(interval)
    print '.'
    sleep(interval)
    print '.'
    sleep(interval)
    puts '.'
    sleep(interval)
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
    answer.downcase == 'y'
  end

  def reset_hands
    @human.reset_hand
    @dealer.reset_hand
  end

  def blackjack_results
    puts "Dealer got a blackjack! You lose D:" if @dealer.hand.blackjack? &&
                                                  !@human.hand.blackjack?
    puts "You got a blackjack! Dealer loses! :D" if @human.hand.blackjack? &&
                                                    !@dealer.hand.blackjack?
  end

  def busted_results
    display_line "You busted! Dealer wins!" if @human.busted?
    display_line "Dealer busted! You win!" if @dealer.busted? && !@human.busted?
  end

  def total_results
    if @dealer.total > @human.total && !@dealer.busted?
      display_line "#{scores_message} Dealer wins!"
    elsif @human.total > @dealer.total && !@human.busted?
      display_line "#{scores_message} You win!"
    end
  end

  def push_results
    display_line "#{scores_message} Push!" if @human.total == @dealer.total
  end

  def goodbye_message
    display_line "Thanks for playing Blackjack!"
  end

  def scores_message
    "Dealer's Total: #{@dealer.total} --- Your Total: #{@human.total} ---"
  end
end

game = Game.new
game.test