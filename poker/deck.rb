require_relative 'card'

class Deck

  
  def self.deploy
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
          deck << Card.new(rank,suit)
      end
    end
    deck
    Deck.new(deck)
  end
  
  
  RANKS = [2,3,4,5,6,7,8,9,10,11,12,13,14]
  SUITS = [:spade, :diamond , :heart , :club]
  
  def initialize(stack = [])
    @stack = stack
  end

  def shuffle!
    @stack.shuffle!
  end
  
  def deal(numofcards)
    self.shuffle![0...numofcards]
  end
  
  def display
    @stack.each do |card|
      puts card
    end
  end
  
  private
  attr_accessor :stack
end 

if __FILE__ == $PROGRAM_NAME
  deck = Deck.deploy
  deck.display
  deck.shuffle!
  deck.display
  print deck.deal(5)
  
end 