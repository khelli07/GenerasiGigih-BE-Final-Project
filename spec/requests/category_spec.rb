require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET" do
    before :each do
      @category = FactoryBot.create(:category)
    end
    
    context "index" do
      it "render index template" do
        get category_index_path
        expect(:response).to render_template :index
      end
    end

    context "new" do
      it "render new template" do
        get new_category_path
        expect(:response).to render_template :new
      end
    end

    context "edit" do
      it "render template edit" do
        get category_edit_path(@category.id)
        expect(:response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new category in the database" do
        expect{
          post "/category", params: { category: attributes_for(:category) }
        }.to change(Category, :count).by(1)
      end

      it "redirects to foods#show" do
        post "/category", params: { category: attributes_for(:category) }
        expect(response).to redirect_to category_index_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new category in the database" do
        expect{
          post "/category", params: { 
            category: attributes_for(:category, name: "") }
        }.not_to change(Category, :count)
      end

      it "does not save the new category in the database" do
        post "/category", params: { 
            category: attributes_for(:category, name: "") }
        expect(response).to have_http_status(400)
      end
    end
  end
    
  describe "POST #delete" do
    it "deletes the category from the database"  do
      category = create(:category)
      expect { 
        post category_delete_path(category.id) 
      }.to change(Category, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @category = FactoryBot.create(:category)
    end

    context "with valid attributes" do
      it "locates the requested @category" do
        patch "/category/#{@category.id}", 
        params: { category: attributes_for(:category) }
        expect(assigns(:category)).to eq(@category)
      end

      it "changes @category's attributes" do
        patch "/category/#{@category.id}", 
        params: { category: attributes_for(:category, name: 'Indian') }
        @category.reload
        expect(@category.name).to eq('Indian')
      end

      it "redirect to category index path" do
        patch "/category/#{@category.id}", 
        params: { category: attributes_for(:category) }
        expect(response).to redirect_to category_index_path
      end
    end
  end
end
