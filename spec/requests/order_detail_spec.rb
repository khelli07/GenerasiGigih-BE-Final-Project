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

  describe "POST #delete" do
    it "deletes the customer from the database"  do
      customer = create(:customer)
      order = create(:order)
      order_detail = create(:order_detail)
      
      expect{ post order_order_detail_delete_path(order.id, customer.id) }.to change(OrderDetail, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @customer = FactoryBot.create(:customer)
      @order = FactoryBot.create(:order)
      @order_detail = FactoryBot.create(:order_detail)
      @link = "/order/#{@order.id}/order_detail/#{@order_detail.id}"
    end

    context "with valid attributes" do
      it "locates the requested @order_detail" do
        patch @link, 
        params: { order_detail: attributes_for(:order_detail) }
        expect(assigns(:order_detail)).to eq(@order_detail)
      end

      it "changes @order_detail's attributes" do
        patch @link, 
        params: { order_detail: attributes_for(:order_detail, qty: 10) }
        @order_detail.reload
        expect(@order_detail.qty).to eq(10)
      end

      it "redirect to order_detail index path" do
        patch @link, 
        params: { order_detail: attributes_for(:order_detail) }
        expect(response).to redirect_to order_path(@order.id)
      end
    end
  end
end
