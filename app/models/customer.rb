class Customer < ApplicationRecord
  has_many :orders
  
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\w+@[A-Za-z]+\.[A-Za-z]+/ }
end
