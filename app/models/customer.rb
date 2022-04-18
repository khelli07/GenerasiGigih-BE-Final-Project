class Customer < ApplicationRecord
  has_many :orders
  
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\w+@[A-Za-z]+\.[A-Za-z]+/ }

  def nickname
    return self.email.split('@')[0].titleize
  end
  
  def delete_orders()
    order = Orders.find_by(customer_id: self.id)
    while order != nil
      order.delete_details()
      order.destroy
      order = Orders.find_by(customer_id: self.id)
    end
  end
  
end
