class OrderController < ApplicationController
  protect_from_forgery
  
  def index
    @orders = Order.order(:status).all
    @total = (@orders.map {|o| o.calculate_price; }).sum
    @orders.each do |o|
      update(o) 
    end
  end

  def show
    @order = Order.find(params[:id])
    update(@order)
    @order_details = @order.get_details
  end

  def new
    @customers = Customer.all
  end

  def create
    Order.reset_pk_sequence
    OrderDetail.reset_pk_sequence

    t = params[:time].to_datetime
    @order = Order.create(order_date:t, 
      status: params[:status], 
      customer_id: params[:cid], 
      total_price:0
    )
    
    redirect_to order_index_path
  end

  def edit
    @order = Order.find(params[:order_id])
  end
  
  def update
    @order = Order.find(params[:order_id])
    @order.update(order_params)
    
    redirect_to order_index_path
  end

  def delete
    @order = Order.find(params[:order_id])
    @order.delete_details
    @order.destroy
    redirect_to order_index_path
  end

  private
  def od_params
    params.require(:order).permit(:order_date, :status, :customer_id, :total_price)
  end

  def update(order)
    order.update(total_price: order.calculate_price)
    if (order.order_date.strftime("%H").to_i >= 12 and order.status != 1)
      order.update(status: 0)
    end
  end
end
