class Category < ApplicationRecord
  has_many :food_categories
  validates :name, presence: true, uniqueness: true
end
