require 'rails_helper'

RSpec.describe "OrderDetails", type: :request do  
  describe "GET new" do
    it "render new template" do
      customer = create(:customer)
      order = create(:order)
      order_detail = create(:order_detail)
      
      get new_order_order_detail_path(order.id)
      expect(:response).to render_template :new
    end
  end

  describe "GET edit" do
    it "render template edit" do
      customer = create(:customer)
      order = create(:order)
      order_detail = create(:order_detail)
      
      get edit_order_order_detail_path(order.id, order_detail.id)
      expect(:response).to render_template :edit
    end
  end

  describe "POST delete" do
    it "deletes the customer from the database"  do
      customer = create(:customer)
      order = create(:order)
      order_detail = create(:order_detail)
      
      expect{ post order_order_detail_delete_path(order.id, customer.id) }.to change(OrderDetail, :count).by(-1)
    end
  end
end
