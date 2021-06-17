require 'pry'
CARD_VALUES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
TARGET = 21
DEALER_HIT_THRESH = 17
MAX_WINS = 5
LINE = "============================================"

# TO DO:
# CHANGE DECK TO USE ARRAY OF HASHES
# INPUT VALIDATION FOR SHOE

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    CARD_VALUES.each do |value|
      deck << {suit: suit, value: value}
    end
  end
  deck
end

def initialize_shoe
  shoe = []
  5.times { shoe.concat(initialize_deck) }
  shoe.shuffle
end  

def convert_values(card_arr)
  new_arr = card_arr.map do |card|
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

shoe = initialize_shoe
card_arr = []
3.times {|_| card_arr << shoe.pop}

puts(card_arr)
puts convert_values(card_arr)