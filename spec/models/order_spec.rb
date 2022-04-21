require 'rails_helper'
require 'test_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should belong_to(:customer) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:customer_id) }
  end

  describe "method validation" do
    before :each do
      @customer = FactoryBot.create(:customer)
      @order = FactoryBot.create(:order)
      @order_detail = FactoryBot.create(:order_detail, qty: 4)
    end

    it "should be able to tell its status" do
      expect(@order.order_status).to eq("PAID")
    end
    
    it "should be able to get its details" do
      expect(@order.get_details).to include(@order_detail)
    end
    
    it "should be able to calculate price" do
      expect(@order.calculate_price).to eq(6)
    end

    it "should be able to cascade delete" do
      @order.delete_details
      @order.destroy
      find = OrderDetail.find_by(id: 1)
      expect(find).to be nil
    end
  end
end
