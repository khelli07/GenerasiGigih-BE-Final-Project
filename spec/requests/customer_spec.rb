require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET" do
    before :each do
      @customer = FactoryBot.create(:customer)
    end
    
    context "index" do
      it "render index template" do
        get customer_index_path
        expect(:response).to render_template :index
      end
    end
  
    context "new" do
      it "render new template" do
        get new_customer_path
        expect(:response).to render_template :new
      end
    end
  
    context "edit" do
      it "render template edit" do
        get customer_edit_path(@customer.id)
        expect(:response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new customer in the database" do
        expect{
          post "/customer", params: { customer: attributes_for(:customer) }
        }.to change(Customer, :count).by(1)
      end

      it "redirects to customer#show" do
        post "/customer", params: { customer: attributes_for(:customer) }
        expect(response).to redirect_to customer_index_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new customer in the database" do
        expect{
          post "/customer", params: { 
            customer: attributes_for(:customer, email: "email@salah") }
        }.not_to change(Customer, :count)
      end
      
      it "returns status code 400" do
        post "/order", params: { 
            customer: attributes_for(:customer, email: "email@salah") }
        expect(response).to have_http_status(400)
      end
    end
  end
  
  describe "POST #delete" do
    it "deletes the customer from the database"  do
      customer = create(:customer)
      expect { 
        post customer_delete_path(customer.id) 
      }.to change(Customer, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @customer = FactoryBot.create(:customer)
    end

    context "with valid attributes" do
      it "locates the requested @customer" do
        patch "/customer/#{@customer.id}", 
        params: { customer: attributes_for(:customer) }
        expect(assigns(:customer)).to eq(@customer)
      end

      it "changes @customer's attributes" do
        patch "/customer/#{@customer.id}", 
        params: { 
          customer: attributes_for(:customer, email: 'maria@gmail.com') }
        @customer.reload
        expect(@customer.email).to eq('maria@gmail.com')
      end

      it "redirect to customer index path" do
        patch "/customer/#{@customer.id}", 
        params: { customer: attributes_for(:customer) }
        expect(response).to redirect_to customer_index_path
      end
    end
  end

end
