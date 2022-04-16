FactoryBot.define do
  factory :order_detail do
    order_id { 1 }
    food_id { 1 }
    food_price { 1.5 }
    qty { 1 }
  end
end
