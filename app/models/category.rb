class Category < ApplicationRecord
  has_many :food_categories
  has_many :foods, :through => :food_categories
  
  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
