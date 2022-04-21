require 'rails_helper'
require 'test_helper'

RSpec.describe Customer, type: :model do
  describe "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }  
    it { should allow_value("savira@gigih.com").for(:email) }
    it { should_not allow_value("halo@gigih").for(:email) }
  end

  describe "method validation" do
    before :each do
      @customer = Customer.create(email:"savira@gigih.com")
    end 
    
    it "should be able to return nickname" do
      expect(@customer.nickname == "Savira").to be(true)
    end
    
    it "should be able to cascade delete order" do
      order = FactoryBot.create(:order, customer_id: 1)
      @customer.delete_orders
      @customer.destroy

      find = Order.find_by(customer_id: 1)
      expect(find).to be(nil)
    end
  end
end
