class FoodCategory < ApplicationRecord
  belongs_to :food
  belongs_to :category
  
  validates :food_id, presence: true
  validates :category_id, presence: true
end
