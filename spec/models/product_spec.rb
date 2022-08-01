require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before do
      @category = Category.create({ :name => 'Ferns' })
    end

    it 'should save a product if name, price, quantity, and category are not nil' do
      @product = Product.create({
        :name => 'Jungle Fern',
        :price_cents => 1000,
        :quantity => 10,
        :category => @category
       })

      expect(@product.id).to be_present
    end

    it 'should throw an error if :name is nil' do
      @product = Product.create({
        :name => nil,
        :price_cents => 1000,
        :quantity => 10,
        :category => @category
       })

       expect(@product.errors.full_messages.length).to be > 0
    end

    it 'should throw an error if :price_cents is nil' do
      @product = Product.create({
        :name => "Jungle Fern",
        :price_cents => nil,
        :quantity => 10,
        :category => @category
        })
        
       expect(@product.errors.full_messages.length).to be > 0
    end

    it 'should throw error if :quantity is nil' do
      @product = Product.create({
        :name => "Jungle Fern",
        :price_cents => 1000,
        :quantity => nil,
        :category => @category
       })

       expect(@product.errors.full_messages.length).to be > 0
    end

    it 'should throw error if :category is nil' do
      @product = Product.create({
        :name => "Jungle Fern",
        :price_cents => 1000,
        :quantity => 10,
        :category => nil
       })
  
       expect(@product.errors.full_messages.length).to be > 0
    end
    
        
  end
end
