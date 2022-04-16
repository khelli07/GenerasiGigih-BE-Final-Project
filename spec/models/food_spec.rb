require 'rails_helper'
require 'test_helper'

RSpec.describe 'Food', type: :model do
  describe "associations" do
    subject { Category.new(name: "Indonesian") }
    subject { Food.new(name: "Es Milo", price: 5.500) }
    subject { FoodCategory.new(food_id: 1, category_id: 1) }

    it { should belong_to(:category) }
  end
  
  describe "validation" do
    subject { Food.new(name: 'Es Milo', price: 5.500) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end
end
