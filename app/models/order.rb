class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :customer_id, presence: true

  def delete_details()
    det = OrdersDetails.find_by(order_id: self.id)
    while det != nil
      det.destroy
      det = OrdersDetails.find_by(order_id: self.id)
    end
  end
end
