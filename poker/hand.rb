require_relative 'deck'
require_relative 'card'

class Hand
  include Enumerable

#
  SCORING = {
                :highcard => 1,
              [1,1,1,1,1] => :check_sorting,
              [1,1,1,2,2] => 2, #one pair
              [1,2,2,2,2] => 3, #two pair
                :straight => 4,
              [1,1,3,3,3] => 5, #three of a kind
                  :flush  => 6,
              [2,2,3,3,3] => 7, #full house
              [1,4,4,4,4] => 8, #four_of_a_kind
           :straightflush => 9
                    }

  def initialize(cards = [])
    @holding = cards
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
    ret + "\n" + "\n"
  end

  def of_a_kind
    score = SCORING[pair_arr]
    if score.is_a?(Integer)
      [score, rank_arr]
    else
      [SCORING[check_sorting] , rank_arr]
    end
  end

  def each(&prc)
    @holding.each(&prc)
  end

  protected

  def check_sorting
    if self.flush? && self.straight?
      :straightflush
    elsif self.straight?
      :straight
    elsif self.flush?
      :flush
    else
      :highcard
    end
  end

  def flush?
    self.each do |card|
      return false if card.suit != @holding.first.suit
    end
    true
  end

  def straight?
    rank_arr.max - rank_arr.min == 4
  end

  def sort!
    @holding.sort!
  end

  def pair_arr
    self.map{|card| count(card)}.sort
  end

  def suit_arr
    self.map{|card| card.suit}.sort
  end

  def rank_arr
    self.map{|card| card.rank}.sort
  end
end



if __FILE__ == $PROGRAM_NAME
  d = Deck.deploy
  hand = Hand.new(d.deal(5))
  p hand.of_a_kind
end
