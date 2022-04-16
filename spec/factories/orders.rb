FactoryBot.define do
  factory :order do
    order_date { "2022-04-16" }
    status { 1 }
    customer_id { 1 }
    total_price { 1.5 }
  end
end
