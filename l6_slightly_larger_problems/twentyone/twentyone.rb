CARD_VALUES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
TARGET = 21
DEALER_HIT_THRESH = 17
MAX_WINS = 5
LINE = "============================================"

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    CARD_VALUES.each do |value|
      deck << { suit: suit, value: value }
    end
  end
  deck.shuffle!
end

def initialize_shoe
  shoe = []
  5.times { shoe.concat(initialize_deck) }
  shoe.shuffle!
end

def initial_deal(shoe_answer)
  deck = initialize_deck
  if shoe_answer.downcase[0] == 's'
    deck = initialize_shoe
  end
  dealer_card_array = draw!(deck)
  player_card_array = draw!(deck)
  [deck, dealer_card_array, player_card_array]
end

def check_bust?(hand_total)
  hand_total > TARGET
end

def check_bj?(hand_total)
  hand_total == TARGET
end

def draw!(deck)
  [deck.pop, deck.pop]
end

def display_hands(dealer_card_array, player_card_array)
  display_dlr_hand(dealer_card_array)
  display_plyr_hand(player_card_array)
end

def display_plyr_hand(card_arr)
  prompt LINE
  card_text = card_arr.map { |card| "#{card[:value]} of #{card[:suit]}" }
  plyr_msg = "You have: #{card_text[0]} and #{card_text[1]}" 
  return prompt plyr_msg if card_arr.size == 2
  card_text[-1] = "and #{card_text.last}"
  prompt "You have: #{card_text.join(', ')}"
end

def display_dlr_hand(card_arr, facedown = false)
  prompt LINE
  card_text = card_arr.map { |card| "#{card[:value]} of #{card[:suit]}" }
  dlr_msg = "Dealer has: #{card_text[0]} and a facedown card"
  return prompt dlr_msg if facedown == true
  card_text[-1] = "and #{card_text.last}"
  prompt "Dealer has: #{card_text.join(', ')}"
end

def display_score(scores)
  prompt "The score is You: #{scores[:player]} to PC: #{scores[:dealer]}"
end

def display_score_message(scores)
  if scores[:dealer] == MAX_WINS
    prompt "The dealer has 5 wins! The dealer is the victor!"
  elsif scores[:player] == MAX_WINS
    prompt "You have 5 wins! You are the victor!"
  end
end

def display_blackjack_message(dealer_total, player_total, scores)
  if dealer_total == TARGET && player_total == TARGET
    prompt "Two Blackjacks! It's a push!"
  elsif dealer_total == TARGET
    scores[:dealer] += 1
    prompt "Dealer has a Blackjack! You lose :("
  elsif player_total == TARGET
    prompt "Blackjack! You win!"
    scores[:player] += 1
  end
end

def display_welcome_msg
  prompt "Welcome to Twenty-One!"
  prompt "The first player to 5 wins is the victor!"
  prompt "Would you like to play with a single deck or a normal shoe (5-decks)?"
  prompt "Press 's' for a shoe, hit the Enter key for a single deck."
end

def display_results(dealer_total, player_total, scores)
  if dealer_total == player_total
    prompt "Push!"
  elsif dealer_total > player_total &&
        check_bust?(dealer_total) == false
    scores[:dealer] += 1
    prompt "Dealer wins!"
  elsif dealer_total > TARGET
    scores[:player] += 1
    prompt "Dealer Busts! You win!"
  else
    scores[:player] += 1
    prompt "You win!"
  end
end

def player_hit?
  valid_responses = ['h', 's']
  answer = ''
  loop do
    prompt "Would you like to hit? Press 'h' to hit, 's' to stay."
    answer = gets.chomp
    break if valid_responses.include?(answer.downcase[0])
    prompt "Whoops! I didn't get that. Please try again!"
  end
  answer.downcase[0] == 'h'
end

def hit!(deck)
  deck.pop
end

def play_again?
  valid_responses = ['y', 'n']
  answer = ''
  loop do
    prompt "Enter 'y' to play another game. Press 'n' to quit."
    answer = gets.chomp
    break if valid_responses.include?(answer.downcase[0])
    prompt "Whoops! That's not a valid answer. Please try again!"
  end
  answer.downcase[0] == 'y'
end

def get_totals(dealer_card_array, player_card_array)
  [get_sum(dealer_card_array), get_sum(player_card_array)]
end

def get_sum(card_array)
  hand_sum = convert_values(card_array).sum
  aces = convert_values(card_array).count(11)
  until hand_sum <= TARGET || aces == 0
    hand_sum -= 10
    aces -= 1
  end
  hand_sum
end

def convert_values(card_arr)
  card_arr.map do |card|
    case card[:value]
    when 'Ace'
      11
    when 'King'
      10
    when 'Queen'
      10
    when 'Jack'
      10
    else
      card[:value]
    end
  end
end

def player_turn(deck, dealer_card_array, player_card_array, player_total)
  until player_hit? == false
    system 'clear'
    display_dlr_hand(dealer_card_array)
    player_card_array << hit!(deck)
    player_total = get_sum(player_card_array)
    display_plyr_hand(player_card_array)
    prompt "Your hand's value is #{player_total}"
    break if check_bust?(player_total)
  end
  player_total
end

def dealer_turn(deck, dealer_card_array, dealer_total)
  prompt "Dealer's turn"
  display_dlr_hand(dealer_card_array, false)
  prompt "Dealer's current hand value is #{dealer_total}"
  until dealer_total >= DEALER_HIT_THRESH
    prompt "Dealer hits!"
    sleep(1)
    dealer_card_array << hit!(deck)
    dealer_total = get_sum(dealer_card_array)
    display_dlr_hand(dealer_card_array)
    prompt "Dealer's new hand value is #{dealer_total}"
  end
  dealer_total
end

def player_bust?(player_total, scores)
  if player_total > TARGET
    scores[:dealer] += 1
    prompt "BUST! You lose :("
  end
  player_total > TARGET
end

display_welcome_msg
shoe_answer = gets.chomp
scores = {
  player: 0,
  dealer: 0
}
loop do
  loop do
    system 'clear'
    deck, dealer_cards, player_cards = initial_deal(shoe_answer)
    display_hands(dealer_cards, player_cards)
    dealer_total, player_total = get_totals(dealer_cards, player_cards)
    prompt "Your hand's value is #{player_total}"
    display_blackjack_message(dealer_total, player_total, scores)
    break if (check_bj?(player_total) && check_bj?(dealer_total)) ||
             (check_bj?(dealer_total)) ||
             (check_bj?(player_total))

    player_total = player_turn(deck, dealer_cards, player_cards, player_total)
    break if player_bust?(player_total, scores)
    dealer_total = dealer_turn(deck, dealer_cards, dealer_total)
    sleep(1)
    display_results(dealer_total, player_total, scores)
    break
  end
  display_score(scores)
  display_score_message(scores)
  break if scores[:dealer] == MAX_WINS ||
           scores[:player] == MAX_WINS
  break if play_again? == false
end
prompt "Thanks for playing!"
