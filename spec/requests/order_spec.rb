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
      order = FactoryBot.create(:order)
      get order_path(order.id)
      expect(:response).to render_template :show
    end
  end

  describe "GET new" do
    it "render new template" do
      get new_order_path
      expect(:response).to render_template :new
    end
  end

  describe "GET edit" do
    it "render template edit" do
      order = FactoryBot.create(:order)
      get order_edit_path(order.id)
      expect(:response).to render_template :edit
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/order/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
