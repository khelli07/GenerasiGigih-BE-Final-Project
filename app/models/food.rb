class Food < ApplicationRecord
  has_many :food_categories

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
