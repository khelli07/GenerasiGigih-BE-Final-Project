require 'rails_helper'
require 'test_helper'

RSpec.describe FoodCategory, type: :model do
  describe "association" do
    it { should have_many(:foods) }
    it { should have_many(:categories) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:food_id) }
    it { should validate_presence_of(:category_id) }
  end
end
