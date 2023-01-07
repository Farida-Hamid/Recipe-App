class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  after_save :recipe_counter
  after_destroy :recipe_counter
  validates :name, presence: true
  validates :description, presence: true, length: { in: 10..250 }

  protected

  def recipe_counter
    user.update(recipe_counter: user.recipes.all.length)
  end
end
