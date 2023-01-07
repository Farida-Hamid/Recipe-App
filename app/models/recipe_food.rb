class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  after_save :food_counter
  after_destroy :food_counter

  validates :quantity, presence: true

  protected

  def food_counter
    @recipe_foods = RecipeFood.where(recipe_id: recipe.id)
    recipe.update(recipe_food_counter: @recipe_foods.all.length)
  end
end
