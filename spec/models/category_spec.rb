require 'rails_helper'
require 'test_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should have_many(:food_categories) }
    it { should have_many(:foods) }
  end
  
  describe "validation" do
    subject { Category.new(name: "Indonesian") }
    it { should validate_presence_of(:name) }
  end
end
