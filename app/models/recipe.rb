class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { in: 10..250 }
end
