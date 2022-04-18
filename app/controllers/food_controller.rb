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
    categories = []
    params[:tags].split(",", -1).each do |fc|
      c = Category.find_by(name: fc)
      categories.append(c.id) if c != nil
    end

    old_count = Food.count
    if (categories.length() != 0)
      @food = Food.create(food_params)
      
      if old_count + 1 == Food.count
        @food.add_categories(categories)
        return redirect_to food_index_path
      end
    end
    
    return self.render_invalid_request
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
