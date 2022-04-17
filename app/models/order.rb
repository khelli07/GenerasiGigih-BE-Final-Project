class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :customer_id, presence: true
end
