require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'will save a product with all fields defined' do
      @testCategory = Category.find_or_create_by! name: "TEST"
      @testProduct = @testCategory.products.create({
        name: "testProduct",
        quantity: 10,
        price: 100
      })
      expect(@testProduct).to be_valid
    end

    it 'will throw an error if product created without name' do
      @testCategory = Category.find_or_create_by! name: "TEST"
      @testProduct = @testCategory.products.create({
        name: nil,
        quantity: 10,
        price: 100
      })
      expect(@testProduct.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'will throw an error if product created without quantity' do
      @testCategory = Category.find_or_create_by! name: "TEST"
      @testProduct = @testCategory.products.create({
        name: "testProduct",
        quantity: nil,
        price: 100
      })
      expect(@testProduct.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'will throw an error if product created without price' do
      @testCategory = Category.find_or_create_by! name: "TEST"
      @testProduct = @testCategory.products.create({
        name: "testProduct",
        quantity: 10,
        price: false
      })
      expect(@testProduct.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'will not save a product if category not defined' do
      @testProduct = Product.new({
        name: "TEST",
        quantity: 10,
        price: 100
      })
      expect(@testProduct).to_not be_valid
    end

  end
end
