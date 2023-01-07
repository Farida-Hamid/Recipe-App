require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  user = User.new(name: 'Farida', email: 'farida7875@gmail.com', password: 'topsecret',
                  password_confirmation: 'topsecret', role: 'admin')

  recipe = Recipe.new(name: 'Aloo ka prantha', description: 'Indian Aloo prantha must try', user_id: user.id)
  food = Food.new(name: 'Apple', measurement_unit: 'grams', price: 12.25)

  subject { RecipeFood.new(quantity: 12, recipe_id: recipe.id, food_id: food.id) }

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'recipe_id should be present' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'food_id should be present' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    expect(subject.quantity).to eql(12)
  end
end
