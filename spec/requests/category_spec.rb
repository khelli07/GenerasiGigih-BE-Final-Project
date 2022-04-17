require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/category/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/category/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/category/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/category/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
