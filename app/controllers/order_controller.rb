class OrderController < ApplicationController
  protect_from_forgery
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order.update(total_price: @order.calculate_price)
    @order_details = @order.get_details
  end

  def new
    @customers = Customer.all
  end

  def create
    Order.reset_pk_sequence
    OrderDetail.reset_pk_sequence

    t = params[:time].to_datetime
    @order = Order.create(order_date:t, status: params[:status], customer_id: params[:cid], total_price:0)
    
    redirect_to order_index_path
  end

  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    
    redirect_to order_index_path
  end

  def delete
    @order = Order.find(params[:id])
    @order.delete_details
    @order.destroy
    redirect_to order_index_path
  end

  private
  def od_params
    params.require(:order).permit(:order_date, :status, :customer_id, :total_price)
  end
end
