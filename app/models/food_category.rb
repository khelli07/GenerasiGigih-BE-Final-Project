class FoodCategory < ApplicationRecord
  belongs_to :foods
  belongs_to :categories 
end
