class FoodController < ApplicationController
  protect_from_forgery
  
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @categories = @food.get_categories.join(', ')
  end

  def new
    @food = Food.new
  end

  def create
    Food.reset_pk_sequence
    FoodCategory.reset_pk_sequence
 
    cids = []
    fcs = params[:tags].split(",", -1)
    fcs.each do |fc|
      c = Category.find_by(name: fc)
      if c != nil
        cids.append(c.id)
      end
    end

    if (cids.length() != 0)
      @food = Food.create(food_params)
      @food.add_categories(cids)
    end 
    # else show error
    
    redirect_to food_index_path
  end

  def edit
    @food = Food.find(params[:food_id])
  end
  
  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    
    redirect_to food_index_path
  end

  def delete
    @food = Food.find(params[:food_id])
    @food.delete_categories
    @food.destroy
    redirect_to food_index_path
  end

  private
  def food_params
    params.require(:food).permit(:name, :price)
  end
  
end
