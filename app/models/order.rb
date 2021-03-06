class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :customer_id, presence: true

  def order_status
    mapper = {"0" => "NEW", "1" => "PAID", "2" => "CANCELED"}
    return mapper[self.status.to_s]
  end
  
  def customer_email
    customer = Customer.find(self.customer_id)
    return customer.email
  end 
  
  def get_details
    details = OrderDetail.where(order_id: self.id)
    return details
  end
  
  def delete_details
    det = OrderDetail.find_by(order_id: self.id)
    while det != nil
      det.destroy
      det = OrderDetail.find_by(order_id: self.id)
    end
  end

  def calculate_price
    details = (OrderDetail
        .where(order_id: self.id)
        .pluck(:food_price, :qty)
        .map {|c|
          price = c[0] * c[1]
        })
    
    return details.sum
  end 
end
