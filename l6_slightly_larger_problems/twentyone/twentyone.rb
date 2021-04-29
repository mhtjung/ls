require 'pry'
CARD_VALUES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
TARGET = 21
DEALER_HIT_THRESH = 17
LINE = "============================================"

def iniatilize_deck
  deck = []
  SUITS.each { |suit| CARD_VALUES.each { |card| deck << [card, suit] } }
  deck.shuffle
end

#creates a 5-deck 'shoe' of cards, as is typical of blackjack tables
def initialize_shoe
  shoe = []
  5.times {shoe.concat(iniatilize_deck)}
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

def check_bust?(card_array)
  get_sum(card_array) > TARGET
end

def check_bj?(card_array)
  true if card_array.size == 2 && get_sum(card_array) == TARGET
end

def blackjack_message(dealer_card_array, player_card_array)
  if check_bj?(player_card_array) && check_bj?(dealer_card_array)
    "Two Blackjacks! It's a push!"
  elsif check_bj?(dealer_card_array)
    "Dealer has a Blackjack! You lose :("
  elsif check_bj?(player_card_array)
    "Blackjack! You win!"
  end
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

def player_hit?
  prompt "Would you like to hit? Press Y to hit, any other key to stay."
  answer = gets.chomp
  answer.downcase[0] == 'y'
end

def hit!(deck)
  deck.pop
end

def display_results(dealer_card_array, player_card_array)
  if get_sum(dealer_card_array) == get_sum(player_card_array)
    "Push!"
  elsif get_sum(dealer_card_array) > get_sum(player_card_array) &&
        check_bust?(dealer_card_array) == false
    "Dealer wins!"
  elsif get_sum(dealer_card_array) > TARGET
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

def display_score(dealer_score, player_score)
  prompt "The score is You: #{player_score} to PC: #{dealer_score}"
end

# game begins here

prompt "Welcome to Twenty-One!"
prompt "The first player to 5 wins is the victor!"
prompt "Would you like to play with a single deck or a normal shoe (5-decks)?"
prompt "Press 's' for a shoe, any other key for a single deck."
shoe_answer = gets.chomp
dealer_score = 0
player_score = 0

loop do
  loop do
    system 'clear'
    deck = iniatilize_deck
    deck = initialize_shoe if shoe_answer.downcase[0] == 's'
    dealer_card_array = draw!(deck)
    player_card_array = draw!(deck)
    display_dlr_hand(dealer_card_array)
    display_plyr_hand(player_card_array)
    prompt "Your hand's value is #{get_sum(player_card_array)}"
    prompt blackjack_message(dealer_card_array, player_card_array)

    # checks if either player has a nat blackjack, increments respective score,
    # and exits game loop if either or both have natural blackjacks
    if check_bj?(dealer_card_array) &&
       !check_bj?(player_card_array)
      dealer_score += 1
      display_score(dealer_score, player_score)
      break
    elsif check_bj?(player_card_array)
      player_score += 1
      display_score(dealer_score, player_score)
      break
    end

    # breaks out of game loop if both players have blackjacks (Push)
    break if check_bj?(player_card_array) &&
             check_bj?(dealer_card_array)

    # player turn/hit sequence
    until player_hit? == false
      system 'clear'
      display_dlr_hand(dealer_card_array)
      player_card_array << hit!(deck)
      display_plyr_hand(player_card_array)
      prompt "Your hand's value is #{get_sum(player_card_array)}"
      break if check_bust?(player_card_array)
    end

    # delivers bust message to player if they busted and breaks out of game loop
    if check_bust?(player_card_array)
      prompt "BUST! You lose :("
      dealer_score += 1
      display_score(dealer_score, player_score)
      break
    end

    # If the player didn't bust, dealer turn/hit sequence begins
    prompt "Dealer's turn"
    display_dlr_hand(dealer_card_array)
    prompt "Dealer's current hand value is #{get_sum(dealer_card_array)}"

    # Dealer hits until soft 17
    until get_sum(dealer_card_array) >= DEALER_HIT_THRESH
      prompt "Dealer hits!"
      sleep(1) # for readability/flow
      dealer_card_array << hit!(deck)
      display_dlr_hand(dealer_card_array)
      prompt "Dealer's new hand value is #{get_sum(dealer_card_array)}"
    end

    sleep(1) # for readability/flow
    prompt(display_results(dealer_card_array, player_card_array))
    case display_results(dealer_card_array, player_card_array)
    when 'Dealer wins!'
      dealer_score += 1
    when 'Push!'
      prompt "Nobody wins!"
    else
      player_score += 1
    end
    display_score(dealer_score, player_score)
    break
    # end of main game loop
  end

  # checks to see if there is an 'ultimate winner'
  # breaks out of game loop if there is
  if dealer_score > 4
    prompt "The dealer has 5 wins! The dealer is the victor!"
    break
  elsif player_score > 4
    prompt "You have 5 wins! You are the victor!"
    break
  end
  break if play_again? == false # Controls looping of game function
end

prompt "Thanks for playing!"
