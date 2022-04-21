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

  describe "POST" do
    context "delete" do
      it "deletes the category from the database"  do
        category = create(:category)
        expect { 
          post category_delete_path(category.id) 
        }.to change(Category, :count).by(-1)
      end
    end  
  end
  
end
