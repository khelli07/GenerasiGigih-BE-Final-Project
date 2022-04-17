require 'rails_helper'
require 'test_helper'

RSpec.describe FoodCategory, type: :model do
  describe "associations" do
    it { should belong_to(:food) }
    it { should belong_to(:category) }
  end
  
  describe "validation" do
    f = FactoryBot.build(:food)
    c = FactoryBot.build(:category)
    fc = FactoryBot.build(:food_category)
    
    it { should validate_presence_of(:food_id) }
    it { should validate_presence_of(:category_id) }
  end
end
