class CategoryController < ApplicationController
  protect_from_forgery
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    Category.reset_pk_sequence
    Category.create(cat_params)

    redirect_to category_index_path
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(cat_params)
    
    redirect_to category_index_path
  end

  def delete
    # Currently decided not allowing delete -> effect on cascade delete!
    redirect_to category_index_path
  end

  private
  def cat_params
    params.require(:category).permit(:name)
  end
end
