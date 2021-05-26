require 'pry'
CARD_VALUES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
TARGET = 21
DEALER_HIT_THRESH = 17
MAX_WINS = 5
LINE = "============================================"

def initialize_deck
  deck = []
  SUITS.each { |suit| CARD_VALUES.each { |card| deck << [card, suit] } }
  deck.shuffle
end

# creates a 5-deck 'shoe' of cards, as is typical of blackjack tables
def initialize_shoe
  shoe = []
  5.times { shoe.concat(initialize_deck) }
  shoe.shuffle
end

def prompt(msg)
  puts "=> #{msg}"
end

def draw!(deck)
  [deck.pop, deck.pop]
end

def display_plyr_hand(card_array)
  prompt LINE
  card1 = "#{card_array[0][0]} of #{card_array[0][1]}"
  card2 = "#{card_array[1][0]} of #{card_array[1][1]}"
  return prompt "You have: #{card1} and #{card2}" if card_array.size == 2
  card_arr_text = card_array.map { |inner| inner.join(' of ') }
  card_arr_text[-1] = "and #{card_arr_text.last}"
  prompt "You have: #{card_arr_text.join(', ')}"
end

def display_dlr_hand(card_array)
  prompt LINE
  crd = "#{card_array[0][0]} of #{card_array[0][1]}"
  return prompt "Dealer has: #{crd} and a facedown card" if card_array.size == 2
  card_arr_text = card_array.map { |inner| inner.join(' of ') }
  card_arr_text[-1] = "and #{card_arr_text.last}"
  prompt "Dealer has: #{card_arr_text.join(', ')}"
end

def player_hit?
  prompt "Would you like to hit? Press Y to hit, any other key to stay."
  answer = gets.chomp
  answer.downcase[0] == 'y'
end

def hit!(deck)
  deck.pop
end

def display_results(dealer_total, player_total)
  if dealer_total == player_total
    "Push!"
  elsif dealer_total > player_total &&
        check_bust?(dealer_total) == false
    "Dealer wins!"
  elsif dealer_total > TARGET
    "Dealer Busts! You win!"
  else
    "You win!"
  end
end

def play_again?
  prompt "Press any key to play another hand. Press 'n' to quit."
  answer = gets.chomp
  answer.downcase[0] != 'n'
end

def display_score(scores)
  prompt "The score is You: #{scores[:player_score]} to PC: #{scores[:dealer_score]}"
end

def display_blackjack_message(dealer_total, player_total)
  if dealer_total == TARGET && player_total == TARGET
    "Two Blackjacks! It's a push!"
  elsif dealer_total == TARGET
    "Dealer has a Blackjack! You lose :("
  elsif player_total == TARGET
    "Blackjack! You win!"
  end
end

def check_bj?(hand_total)
  hand_total == TARGET
end

def convert_values(card_array)
  values = card_array.map { |inner| inner[0] }
  values.map do |x|
    if x == 'King' || x == 'Queen' || x == 'Jack'
      10
    elsif x == 'Ace'
      11
    else
      x
    end
  end
end

def get_sum(card_array)
  hand_sum = convert_values(card_array).sum
  aces = convert_values(card_array).count(11)
  # handles conversion of an Ace from an 11 to a 1 based on hand value
  until hand_sum <= TARGET || aces == 0
    hand_sum -= 10
    aces -= 1
  end
  hand_sum
end

def check_bust?(hand_total)
  hand_total > TARGET
end
# game begins here

def display_welcome_msg
  prompt "Welcome to Twenty-One!"
  prompt "The first player to 5 wins is the victor!"
  prompt "Would you like to play with a single deck or a normal shoe (5-decks)?"
  prompt "Press 's' for a shoe, any other key for a single deck."
end

display_welcome_msg
shoe_answer = gets.chomp
scores = {
  player_score: 0,
  dealer_score: 0
}

loop do
  loop do
    system 'clear'
    deck = initialize_deck
    deck = initialize_shoe if shoe_answer.downcase[0] == 's'
    dealer_card_array = draw!(deck)
    player_card_array = draw!(deck)
    display_dlr_hand(dealer_card_array)
    display_plyr_hand(player_card_array)

    player_total = get_sum(player_card_array)
    dealer_total = get_sum(dealer_card_array)

    prompt "Your hand's value is #{player_total}"
    prompt display_blackjack_message(dealer_total, player_total)

    if check_bj?(dealer_total) &&
       !check_bj?(player_total)
      scores[:dealer_score] += 1
      display_score(scores)
      break
    elsif check_bj?(player_total)
      scores[:player_score] += 1
      display_score(scores)
      break
    end

    break if check_bj?(player_total) &&
             check_bj?(dealer_total)
    # can't bust before this point
    # card_array starts to be mutated
    until player_hit? == false
      system 'clear'
      display_dlr_hand(dealer_card_array)
      player_card_array << hit!(deck)
      player_total = get_sum(player_card_array)
      display_plyr_hand(player_card_array)
      prompt "Your hand's value is #{player_total}"
      break if check_bust?(player_total)
    end

    if check_bust?(player_total)
      prompt "BUST! You lose :("
      scores[:dealer_score] += 1
      display_score(scores)
      break
    end

    prompt "Dealer's turn"
    display_dlr_hand(dealer_card_array)
    prompt "Dealer's current hand value is #{dealer_total}"

    until dealer_total >= DEALER_HIT_THRESH
      prompt "Dealer hits!"
      sleep(1)
      dealer_card_array << hit!(deck)
      dealer_total = get_sum(dealer_card_array)
      display_dlr_hand(dealer_card_array)
      prompt "Dealer's new hand value is #{dealer_total}"
    end

    sleep(1)
    prompt(display_results(dealer_total, player_total))
    case display_results(dealer_total, player_total)
    when 'Dealer wins!'
      scores[:dealer_score] += 1
    when 'Push!'
      prompt "Nobody wins!"
    else
      scores[:player_score] += 1
    end
    display_score(scores)
    break
  end
  if scores[:dealer_score] == MAX_WINS
    prompt "The dealer has 5 wins! The dealer is the victor!"
    break
  elsif scores[:player_score] == MAX_WINS
    prompt "You have 5 wins! You are the victor!"
    break
  end
  break if play_again? == false
end

prompt "Thanks for playing!"
