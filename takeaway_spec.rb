require 'takeaway'

describe Takeaway do
    
    it ' should return a welcome message and the menu' do
        takeaway = Takeaway.new()
        expect(takeaway.welcome()).to eq('Welcome to the Land of Halal. This is our menu')
    end
    
    it 'should append the customers order to the order array and return nothing if the item is in the menu' do
        takeaway = Takeaway.new()
        expect(takeaway.add('Pizza Margherita')).to eq(nil)
    end
    
    it 'should return an error and tell the customer that the item is not in the menu' do
        takeaway = Takeaway.new()
        expect{takeaway.add('Chicken Burger')}.to raise_error("We do not have that item on the menu! Did you never learn how to read, Doofus!")
    end
    
    it 'returns an error if the item does not exist in the order' do
         takeaway = Takeaway.new()
         expect{takeaway.remove('Chicken Burger')}.to raise_error("The item is not in your order dimwit. Are you suffering from memory loss?")
    end
    
end