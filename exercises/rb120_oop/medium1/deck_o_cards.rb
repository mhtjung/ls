class Card
  include Comparable

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @value = parse_rank(rank)
    @suit = suit
  end

  def <=>(other_card)
    @value <=> other_card.value
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  private
  
  def parse_rank(rank)
    case rank
    when 'Ace'   then 13
    when 'King'  then 12
    when 'Queen' then 11
    when 'Jack'  then 10
    else rank
    end
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  def initialize
    @cards = create_deck
  end

  def draw
    reset_deck if @cards.size == 0
    @cards.shift
  end

  private

  def reset_deck
    @cards = create_deck
  end

  def create_deck
    deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
