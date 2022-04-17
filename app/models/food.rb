class Food < ApplicationRecord
  has_many :food_categories

  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 150 }
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0.1 }
  
end
