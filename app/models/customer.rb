class Customer < ApplicationRecord
  has_many :orders
  
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\w+@[A-Za-z]+\.[A-Za-z]+/ }

  def delete_orders()
    ord = Orders.find_by(customer_id: self.id)
    while ord != nil
      ord.delete_details()
      ord.destroy
      ord = Orders.find_by(customer_id: self.id)
    end
  end
end
