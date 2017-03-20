require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Creating a Product in Category' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      cat1.products.create(name: "who", price: 12.2, quantity: 32)
      expect(cat1).to be_present
    end
    it 'Creating a Product in Category' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      categoryID = Category.where(name: 'Apparel').pluck(:id)
      product = Product.create(name: "who", price: 12.2, quantity: 32, category_id: categoryID[0])
      expect(product).to be_present
    end
    it 'Creating a Product in Category where category_id doesnt exist (fail)'  do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      categoryID = Category.where(name: 'Apparel').pluck(:id)
      expect {Product.create(name: "who", price: 12.2, quantity: 32, category_id: categoryID[0] + 1)}.to raise_error(UncaughtThrowError)
    end
    it 'Creating a Product in Category with no name' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      categoryID = Category.where(name: 'Apparel').pluck(:id)
      product = Product.create(price: 12.2, quantity: 32, category_id: categoryID[0])
      expect(product.persisted?).to be_falsey
    end
    it 'Creating a Product in Category with no price' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      categoryID = Category.where(name: 'Apparel').pluck(:id)
      product = Product.create(name: "who", quantity: 32, category_id: categoryID[0])
      expect(product.persisted?).to be_falsey
    end
    it 'Creating a Product in Category with no quantity' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      categoryID = Category.where(name: 'Apparel').pluck(:id)
      product = Product.create(name: "who", price: 12.2, category_id: categoryID[0])
      expect(product.persisted?).to be_falsey
    end
  end
end