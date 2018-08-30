require 'rspec'
require 'towers'

RSpec.describe do 
  
  describe "towers_of_hanoi" do 
    
    describe "#initialize" do 
      it "initializes disks in the correct position"
      it "towers are a nested array of stacks"
    end 
    
    describe "#move" do 
      it 'moves the disk from one stack to another'
    end 
    
    describe "#won?" do   
      it 'returns true when stack is in order'
      it "returns false if disks are on starting disk"
      it "returns false if stacks are not in order"
      
    end 
    
    describe "#valid_move?" do 
      it "returns true if the from stack is not empty"
      it "returns false if the disks are not in order"
    end 
    
  end 
end 