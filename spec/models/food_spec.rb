require 'rails_helper'
require 'test_helper'

RSpec.describe 'Food', type: :model do
  describe "associations" do
    subject { Category.new(name: "Indonesian") }
    subject { Food.new(name: "Es Milo", price: 5500) }
    subject { FoodCategory.new(food_id: 1, category_id: 1) }

    it { should belong_to(:category) }
  end
  
  describe "self validation" do
    subject { Food.new(name: 'Es Milo', price: 5500) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_uniqueness_of(:name) }
    
    it { should allow_value(0.1).for(:price) }
    it { should allow_value(5500).for(:price) }
    it { should_not allow_value(0.01).for(:price) }
    it { should_not allow_value(0.0).for(:price) }
  end

  describe "method validation" do
    before :each do
      @category1 = Category.create(id: 1, name: "Sweet")
      @category2 = Category.create(id: 2, name: "Dessert")
      @food = Food.create(id: 1, name: "Ice Cream", price: 7000)
      @fc1 = FoodCategory.create(food_id: 1, category_id: 1)
      @fc2 = FoodCategory.create(food_id: 1, category_id: 2)
    end

    it "should be able to return its categories" do
      expect(@food.get_categories_name).to include("Sweet", "Dessert")
    end 
  end 
end
