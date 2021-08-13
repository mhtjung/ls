=begin
Twenty-One is a card game consisting of a dealer and a player, where the
participants try to get as close to 21 without going over.

Overview:
- Both player and dealer are dealt 2 cards from a 52 card deck.
- The player takes the first turn
  - Player can hit, or stop
  - If player busts, they automatically lose
- The dealer goes next
  - Dealer must hit until at least 17
  - If dealer busts, player wins
- If neither player busts, the highest total wins
- If the totals are equal, it's a push

Nouns: Card, Player, Dealer, Participant, Deck, Game, Total
Verbs: Deal, Hit, Stay, Busts

Objects:
Player
 - Hit
 - Stay
 - Busted?
 - Total
Dealer
 - Hit
 - Stay
 - Busted?
 - Total

Deck
 - Deal
Card
Game
=end
require 'pry'

class Hand < Array
  def include?(card)
    values.include?(card.value?)
  end

  def include_names?(card)
    names.include?(card.name)
  end

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
  SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds']
  VALUES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']

  def initialize
    @cards = create_deck
  end

  def create_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle
  end

  def deal
    @cards.shift
  end
end

class Card
  attr_reader :suit, :name
  attr_accessor :value

  def initialize(value, suit)
    @name = value
    @value = convert(value)
    @suit = suit
  end

  def to_s
    "#{@name} of #{@suit}"
  end

  def convert(value)
    case value
    when 'Ace' then 11
    when 'King', 'Queen', 'Jack' then 10
    else value
    end
  end
end

class Player
  attr_accessor :hand, :name

  def initialize
    @hand = Hand.new
  end

  def show_hand
    cards = @hand.dup
    if @hand.size == 2
      puts "#{@name}'s hand: #{@hand[0]} and a #{@hand[1]}"
    else
      last_two = []
      2.times { |_| last_two.unshift(cards.pop) }
      last_two = last_two.join(' & ')
      cards << last_two
      puts "#{@name}: #{cards.join(', ')}"
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
  def initialize
    @name = set_name
    super()
  end

  def set_name
    answer = nil
    loop do
      puts "What's your name?"
      answer = gets.chomp
      break unless answer.empty?
      puts "Sorry, invalid input!"
    end
    answer
  end

  def turn(deck)
    choice = nil
    loop do
      choice = hit_or_stay
      break if choice == :s
      hit(deck) if choice == :h
      show_hand
      break if busted?
    end
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
      puts "#{@name}'s hand: #{@hand[0]} and a facedown card."
    else
      super()
    end
  end

  def turn(deck)
    show_hand
    puts "Dealer stays!" if @hand.total >= 17
    loop do
      break if @hand.total >= 17
      puts "Dealer hits until 17!"
      hit(deck)
      show_hand
      break if busted?
      sleep(1)
    end
  end
end

class Game
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
      display_cards(:facedown)
      display_cards if blackjacks?
      break if blackjacks?
      player_turns
      break
    end
    display_results
  end

  def player_turns
    human_turn
    dealer_turn
  end

  def initialization
    clear_screen
    greeting
    init_deck
    init_players
  end

  def blackjacks?
    @human.hand.blackjack? || @dealer.hand.blackjack?
  end

  def reset_hands
    @human.discard_hand
    @dealer.discard_hand
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

  def display_results
    blackjack_results
    busted_results if !blackjacks?
    total_results if !blackjacks?
    push_results
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

  def init_players
    @human = Human.new
    @dealer = Dealer.new
  end

  def init_deck
    @deck = Deck.new
  end

  def busted_message
    puts "You busted! You lose! :("
  end

  def human_turn
    @human.turn(@deck)
  end

  def dealer_turn
    @dealer.turn(@deck) unless @human.busted?
  end

  def deal_cards
    reset_hands
    2.times { |_| @human.hit(@deck) }
    2.times { |_| @dealer.hit(@deck) }
  end

  def display_cards(symbol = nil)
    clear_screen
    @dealer.show_hand(symbol)
    @human.show_hand
  end

  def greeting
    puts "Welcome to Blackjack!"
  end

  def goodbye_message
    puts "Thanks for playing Blackjack!"
  end

  def clear_screen
    system('clear')
  end
end

twentyone = Game.new
twentyone.play
