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
end
