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
    count = Food.count
    begin
      @food = Food.create(name: params[:name], price:params[:price])
      @food.add_categories(params[:categories])
    rescue Exception => e
      return render_invalid_request 
    end
    
    return render_invalid_request if count + 1 != Food.count
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
    params.require(:food).permit(:name, :price)
  end

end
