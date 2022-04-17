class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :customer_id, presence: true

  def calculate_price()
    details = (OrderDetail
        .where(order_id: self.id)
        .pluck(:food_price, :qty)
        .map {|c|
          price = c[0] * c[1]
        })
    
    return details.sum
  end
  
  def get_details()
    details = OrderDetail.where(order_id: self.id)
    return details
  end
  
  def delete_details()
    det = OrdersDetails.find_by(order_id: self.id)
    while det != nil
      det.destroy
      det = OrdersDetails.find_by(order_id: self.id)
    end
  end
end
