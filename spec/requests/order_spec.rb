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
end
