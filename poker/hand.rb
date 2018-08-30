require_relative 'deck'
require_relative 'card'

class Hand 
  include Enumerable
  
  SCORING = {
              [1,1,1,1,1] => :check ,
              [1,1,1,2,2] => 2,
              [1,2,2,2,2] => 3,
              [1,1,3,3,3] => 4,
              [2,2,3,3,3] => 7,
              [1,4,4,4,4] => 8,
                    }
  
  def initialize(cards = [])
    @holding = cards
  end
   
  def each(&prc)
    @holding.each(&prc)
  end 
  
  def discard(indices = []) 
    keeps = self.reject.with_index {|el, i| indices.include?(i)}
    @holding = keeps
  end 
  
  def take_cards(cards)
    cards.each do |card|
      @holding << card
    end 
    @holding.sort!
  end
  
  def to_s 
    ret = ""
    self.each {|el| ret << el.to_s}
    ret
  end
  
  def sort! 
    @holding.sort!
  end 
  
  def pair_arr
    self.map{|card| count(card)}.sort
  end
  
  def of_a_kind
    SCORING[pair_arr]  
  end
  
end 

if __FILE__ == $PROGRAM_NAME
  d = Deck.deploy
  for i in (0..5)
    hand = Hand.new(d.deal(5))
    puts hand
    p hand.of_a_kind
  end 
end 