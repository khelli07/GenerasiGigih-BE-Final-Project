require 'rails_helper'
require 'test_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should belong_to(:customer) }
  end
  
  describe "basic validation" do
    it { should validate_presence_of(:customer_id) }
  end
end
