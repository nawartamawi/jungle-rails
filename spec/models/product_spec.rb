require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do 
  @category = Category.create!(name: 'Test Category')
  @p1 = @category.products.new(
    name:  'Test Product',
    description: 'test description',
    quantity: 1,
    price: 64.99)
  end 
  describe 'Validation' do
    it 'should save product successfully' do 
      @p1.valid?
      expect(@p1.errors.full_messages.length).to eql(0)
    end 

    it 'should has name' do 
      @p1.name = nil
      @p1.valid?
      expect(@p1.errors.full_messages).to include("Name can't be blank")

    end 

    it 'should has price' do 
      @p1.price_cents = nil 
      @p1.valid?
      expect(@p1.errors.full_messages).to include("Price can't be blank")
    end 

    it 'should has quantity' do 
      @p1.quantity = nil 
      @p1.valid?
      expect(@p1.errors.full_messages).to include("Quantity can't be blank")

    end 

    it 'should has category' do 
      @p1.category= nil 
      @p1.valid?
      expect(@p1.errors.full_messages).to include("Category can't be blank")
    end 
  end 
end
