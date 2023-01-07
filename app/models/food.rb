class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  after_save :recipe_counter
  after_destroy :recipe_counter

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

  protected

  def recipe_counter
    user.update(food_counter: user.foods.all.length)
  end
end
