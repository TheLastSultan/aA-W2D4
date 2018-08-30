require 'colorize'

class Card
  attr_reader :rank, :suit
  def initialize(rank,suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s 
    char = ""
    case @suit
    when :heart
      char = "♥️".colorize(:color => :red, :background => :white)
    when :spade
      char = "♠️".colorize(:color => :black, :background => :white)
    when :diamond
      char = "♦️".colorize(:color => :red, :background => :white)
    when :club
      char = "♣️".colorize(:color => :black, :background => :white)
    end 
    rank = @rank
    rank = 'A' if @rank == 14
    rank = 'K' if @rank == 13
    rank = 'Q' if @rank == 12
    rank = 'J' if @rank == 11
    rank = rank.to_s.black
    "#{char} #{rank}#{char}".colorize(:background => :white) 
  end
  
  def <=>(card)
    self.rank <=> card.rank
  end
  
  def ==(card)
    self.rank == card.rank
  end
  
end

if __FILE__ == $PROGRAM_NAME
  c1 = Card.new(3,:diamond)
  c2 = Card.new(3,:heart)
  c3 = Card.new(13, :spade)
  puts c1
  puts c3
  puts c1 <=> c3
  puts c3 <=> c2
end 