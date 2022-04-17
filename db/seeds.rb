# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'

Category.create(name:"Indonesian")
Category.create(name:"Italian")
Category.create(name:"Rice")
Category.create(name:"Drink")

Food.create(name:"Es Milo", price:5500)
Food.create(name:"Nasi Goreng", price:15000)

FoodCategory.create(food_id: 1, category_id:4)
FoodCategory.create(food_id: 2, category_id:1)
FoodCategory.create(food_id: 2, category_id:3)

Customer.create(email:"satu@gmail.com")
Customer.create(email:"dua@gmail.com")
Customer.create(email:"tiga@gmail.com")

Order.create(order_date:DateTime.now(), status:0, customer_id:1, total_price:5500)
Order.create(order_date:DateTime.now(), status:1, customer_id:2, total_price:20500)

OrderDetail.create(order_id:1, food_id:1, food_price:5500, qty:1)
OrderDetail.create(order_id:2, food_id:1, food_price:5500, qty:1)
OrderDetail.create(order_id:2, food_id:2, food_price:15000, qty:1)