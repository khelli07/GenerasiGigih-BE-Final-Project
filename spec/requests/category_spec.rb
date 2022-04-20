require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET index" do
    it "render index template" do
      get category_index_path
      expect(:response).to render_template :index
    end
  end

  describe "GET new" do
    it "render new template" do
      get new_category_path
      expect(:response).to render_template :new
    end
  end

  describe "GET edit" do
    it "render template edit" do
      category = FactoryBot.create(:category)
      get category_edit_path(category.id)
      expect(:response).to render_template :edit
    end
  end

  describe "POST delete" do  
    it "deletes the category from the database"  do
      category = create(:category)
      expect{ post category_delete_path(category.id) }.to change(Category, :count).by(-1)
    end
  end
end
