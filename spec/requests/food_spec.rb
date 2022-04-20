require 'rails_helper'

RSpec.describe "Foods", type: :request do
  describe "GET index" do
    it "render index template" do
      get food_index_path
      expect(:response).to render_template :index
    end
  end

  describe "GET show" do
    it "returns http success" do
      food = FactoryBot.create(:food)
      get food_path(food.id)
      expect(:response).to render_template :show
    end
  end

  describe "GET new" do
    it "render new template" do
      get new_food_path
      expect(:response).to render_template :new
    end
  end

  describe "GET edit" do
    it "returns http success" do
      food = FactoryBot.create(:food)
      get food_edit_path(food.id)
      expect(:response).to render_template :edit
    end
  end

  describe "POST delete" do  
    it "deletes the food from the database"  do
      food = create(:food)
      expect{ post food_delete_path(food.id) }.to change(Food, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @food = create(:food)
    end

    context "with valid attributes" do
      it "locates the requested @food" do
        patch "/food/#{@food.id}", params: { food: attributes_for(:food) }
        expect(assigns(:food)).to eq(@food)
      end

      it "changes @food's attributes" do
        patch "/food/#{@food.id}", params: { food: attributes_for(:food, name: 'Nasi Uduk') }
        @food.reload
        expect(@food.name).to eq('Nasi Uduk')
      end

      it "redirect to food index path" do
        patch "/food/#{@food.id}", params: { food: attributes_for(:food) }
        expect(response).to redirect_to food_index_path
      end
    end
  end
end
