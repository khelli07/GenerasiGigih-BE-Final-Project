class OrderDetailController < ApplicationController
  protect_from_forgery
  
  def new
    @order = Order.find(params[:order_id])
    @foods = Food.all
    @order_details = OrderDetail.new
  end

  def create
    OrderDetail.reset_pk_sequence
    
    fprice = Food.find(params[:fid]).price
    OrderDetail.create(order_id:params[:oid], 
      food_id:params[:fid], 
      food_price:fprice, 
      qty: params[:qty]
    )

    redirect_to order_path(params[:oid])
  end

  def edit
    @order_detail = OrderDetail.find(params[:id])
    @foods = Food.all
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(od_params)
    
    redirect_to order_path(params[:order_id])
  end
  
  def delete
    od = OrderDetail.find(params[:id])
    oid = od.order_id
    od.destroy
    
    redirect_to order_path(oid)
  end

  private
  def od_params
    params.require(:order_detail).permit(:order_id, :food_id, :food_price, :qty)
  end
end
