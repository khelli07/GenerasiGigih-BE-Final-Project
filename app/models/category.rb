class Category < ApplicationRecord
  has_many :food_categories
  has_many :foods, :through => :food_categories
  
  validates :name, presence: true, uniqueness: { case_sensitive: true }

  def delete_food_categories
    fc = FoodCategory.find_by(category_id: self.id)
    while fc != nil
      fc.destroy
      fc = FoodCategory.find_by(category_id: self.id)
    end
  end
end
