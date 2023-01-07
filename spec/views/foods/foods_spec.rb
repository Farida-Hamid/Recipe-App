require 'rails_helper'

RSpec.describe "Foods", type: :feature do
  describe 'index page' do
    before(:each) do
      user = User.create(name: 'Farida', email: 'farida@gmail.com', password: 'topsecret')

      @food1 = Food.create(name: 'Nyama choma', measurement_unit: 'Kilogrammes', price: 800, quantity: 1)
      @food2 = Food.create(name: 'Chips', measurement_unit: 'Pounds', price: 150, quantity: 0.5)
      @food3 = Food.create(name: 'Banana bread', measurement_unit: 'Kilogrammes', price: 1000, quantity: 4)
      @foods = Food.all

      visit foods_path
    end
    scenario 'can see the foods name' do
      @foods.each do |user|
        expect(page).to have_content(food.name)
      end
    end

    scenario 'can see the foods prices' do
      @foods.each do |user|
        expect(page).to have_content(food.price)
      end
    end
    
    scenario 'can see the food quantity' do
      @foods.each do |user|
        expect(page).to have_content(food.quantity)
      end
    end
  end
end
