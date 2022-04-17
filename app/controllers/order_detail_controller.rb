class OrderDetailController < ApplicationController
  protect_from_forgery
  
  def new
    @order_details = OrderDetail.new
  end

  def edit
  end

  def update
    
    redirect_to order_path(params[:order_id])
  end
  
  def delete

    redirect_to order_path(params[:order_id])
  end

  private
  def od_params
    params.require(:order_detail).permit(:order_id, :food_id, :food_price, :qty)
  end
end
