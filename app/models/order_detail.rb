class OrderDetail < ApplicationRecord
  belongs_to :order 
  
  validates :order_id, presence: true
  
  def food_name 
    food = Food.find(self.food_id)
    return food.name
  end
end
