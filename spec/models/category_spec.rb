require 'rails_helper'
require 'test_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should have_many(:food_categories) }
    it { should have_many(:foods) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }     
  end
end
