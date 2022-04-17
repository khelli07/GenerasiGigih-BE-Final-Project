require 'rails_helper'

RSpec.describe "OrderDetails", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/order_detail/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/order_detail/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/order_detail/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
