class Recipe < ApplicationRecord
  belongs_to :user
  after_save :recipe_counter
  validates :name, presence: true
  validates :description, presence: true, length: { in: 10..250 }

  protected

  def recipe_counter
    user.update(recipe_counter: user.recipes.all.length)
  end
end
