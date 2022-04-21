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
  
  describe "POST" do
    context "delete" do
      it "deletes the customer from the database"  do
        customer = create(:customer)
        expect { 
          post customer_delete_path(customer.id) 
        }.to change(Customer, :count).by(-1)
      end
    end
  end

end
