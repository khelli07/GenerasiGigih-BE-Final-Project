class OrderDetailController < ApplicationController
  protect_from_forgery
  
  def new
    @order = Order.find(params[:order_id])
    @foods = Food.all
    @order_details = OrderDetail.new
  end

  def create
    OrderDetail.reset_pk_sequence
    
    food_price = Food.find(params[:food_id]).price
    
    OrderDetail.create(order_id:params[:order_id], 
      food_id:params[:food_id], 
      food_price:food_price, 
      qty: params[:qty]
    )

    redirect_to order_path(params[:order_id])
  end

  def edit
    @order_detail = OrderDetail.find(params[:order_detail_id])
    @foods = Food.all
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    
    redirect_to order_path(params[:order_id])
  end
  
  def delete
    order_detail = OrderDetail.find(params[:order_detail_id])
    order_id = order_detail.order_id
    order_detail.destroy
    
    redirect_to order_path(order_id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :food_id, :food_price, :qty)
  end
end
