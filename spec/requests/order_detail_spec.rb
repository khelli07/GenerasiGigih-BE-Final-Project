require 'rails_helper'

RSpec.describe "OrderDetails", type: :request do
  describe "GET new" do
    it "render new template" do
      get new_order_detail_path
      expect(:response).to render_template :new
    end
  end

  describe "GET edit" do
    it "render template edit" do
      order_detail = FactoryBot.create(:order_detail)
      get order_detail_edit_path(order_detail.id)
      expect(:response).to render_template :edit
    end
  end

  describe "POST delete" do
    it "deletes the customer from the database"  do
      order_detail = create(:order_detail)
      expect{ post order_detail_delete_path(customer.id) }.to change(OrderDetail, :count).by(-1)
    end
  end
end
