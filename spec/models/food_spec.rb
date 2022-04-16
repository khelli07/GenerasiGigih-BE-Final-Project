require 'rails_helper'
require 'test_helper'

RSpec.describe 'Food', type: :model do
  describe "associations" do
    it { should belong_to(:food_categories) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end
end
