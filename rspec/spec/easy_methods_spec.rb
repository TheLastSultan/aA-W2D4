require 'rspec'
require 'easy_methods'


RSpec.describe do 
  
  describe "easy methods" do 

    describe "#my_uniq" do
      let(:arr) {[1,1,2,1,3]}
      
      it "works on an empty array " do 
        expect(my_uniq([])).to be_empty
      end 
      
      it "works on a 1 element array" do 
        expect(my_uniq([1])).to eq([1])
      end 
      
      it "works on a big array, you know, like normal sized." do 
        expect(my_uniq(arr)).to eq([1,2,3])
      end 
    end

    describe "#two_sum" do
      
      it "raises error on an empty array" do 
        expect {two_sum([])}.to raise_error
      end 
      it "raises error on an array with one element " do 
        expect {two_sum([1])}.to raise_error
      end 
      
      let(:arr1) {[-1,2,-2,3]}
      it "sorts nested element" do 
        expect(two_sum(arr1)).to eq([[1,2]])
      end 
      
      let(:arr) {[-1,2,-2,3,1]}
      it "sorts entire element" do
        expect(two_sum(arr)).to eq([[0,4],[1,2]])
      end
      
      it "doesn't return the same element twice for a two_sum" do
        expect(two_sum([0,2,3])).to eq([])
      end
      
    end

    describe "#my_transpose" do
      subject(:matrix) {[
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8]
                    ]}
    
      it "does not call the #transpose method" do
        expect(my_transpose(matrix)).to_not receive(:transpose)
      end
      
      it "works " do
        expect(my_transpose(matrix)).to eq(matrix.transpose)
      end
    end

    describe "#stock_picker" do
      subject(:stock) {stock_picker([2, 3, 5, 1, 3])}
      
      it "returns nil if there are no profitable pairs" do
        expect(stock_picker([5,5,5])).to be_nil
      end
      
      it "doesn't sell before it buys" do
        is_expected.to eq(stock.sort) 
      end
      it "returns the most profitable stock" do 
        expect(stock).to eq([0,2])
      end 
      
    end 
      
  end 
end