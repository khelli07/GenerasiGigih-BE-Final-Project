class CategoryController < ApplicationController
  protect_from_forgery
  
  def index
    @categories = Category.all
  end

  def new
    @category = category.new
  end

  def create
    @category = Category.create(name:"Indonesian")
    redirect_to category_index_path
  end
  
  def edit
  end

  def delete
  end
end
