class FoodController < ApplicationController
  protect_from_forgery
  
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @categories = @food.get_categories_name.join(', ')
  end

  def new
    @food = Food.new
  end

  def create
    categories = params[:categories]
    return render_invalid_request if (categories.length() == 1)

    count = Food.count
    @food = Food.create(food_params)
    return render_invalid_request if count + 1 != Food.count
  
    @food.add_categories(categories)
    return redirect_to food_index_path
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
    params.require(:food).permit(:name, :price, :category_ids)
  end

end
