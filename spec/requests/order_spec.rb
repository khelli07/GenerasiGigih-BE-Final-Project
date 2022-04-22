require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET index" do
    it "render index template" do
      get order_index_path
      expect(:response).to render_template :index
    end
  end
  
  describe "GET show" do
    it "returns http success" do
      customer = create(:customer)
      order = create(:order)
      get order_path(order.id)
      expect(:response).to render_template :show
    end
  end

  describe "GET new" do
    it "render new template" do
      customer = create(:customer)
      
      get new_order_path
      expect(:response).to render_template :new
    end
  end

  describe "POST #create" do
    before :each do
      @customer = Customer.create(id: 1, email:"halo@nama.com")
    end
    
    context "with valid attributes" do
      it "saves the new order in the database" do
        expect{
          post "/order", params: { 
            time: Time.now,
            status: 1, 
            cid: @customer.id, 
          }
        }.to change(Order, :count).by(1)
      end

      it "redirects to order#index" do
         post "/order", params: { 
            time: Time.now,
            status: 1, 
            cid: @customer.id, 
          }
        expect(response).to redirect_to order_index_path
      end
    end 

    context "with invalid attributes" do
      it "returns status code 400 if false" do
        post "/order", params: { order: create(:order) }
        expect(response).to have_http_status(400)
      end
    end
  end
  
  describe "POST delete" do
    it "deletes the customer from the database"  do
      customer = create(:customer)
      order = create(:order)
      
      expect{ post order_delete_path(order.id) }.to change(Order, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @customer = FactoryBot.create(:customer)
      @order = FactoryBot.create(:order)
    end

    context "with valid attributes" do
      it "locates the requested @order" do
        patch "/order/#{@order.id}", 
        params: { order: attributes_for(:order) }
        expect(assigns(:order)).to eq(@order)
      end

      it "changes @order's attributes" do
        patch "/order/#{@order.id}", 
        params: { cid: @order.customer_id, status: 2 }
        @order.reload
        expect(@order.status).to eq(2)
      end

      it "redirect to order index path" do
        patch "/order/#{@order.id}", 
        params: { order: attributes_for(:order) }
        expect(response).to redirect_to order_index_path
      end
    end
  end
end
