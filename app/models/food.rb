class Food < ApplicationRecord
  has_many :food_categories

  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 150 }
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0.1 }

  def get_categories
    categories = (FoodCategory
        .where(food_id: self.id)
        .pluck(:category_id)
        .map {|c|
          name = Category.find(c).name
        })
    
    return categories
  end

  def add_categories(category_id_list)
    category_id_list.each do |cid|
      fc = FoodCategory.find_by(food_id:self.id, category_id:cid)
      if fc == nil
        FoodCategory.create(food_id:self.id, category_id:cid)
      end
    end
  end
  
  def delete_categories
    fc = FoodCategory.find_by(food_id: self.id)
    while fc != nil
      fc.destroy
      fc = FoodCategory.find_by(food_id: self.id)
    end
  end
end
