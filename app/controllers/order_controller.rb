class OrderController < ApplicationController
  protect_from_forgery
  
  def index
    @orders = Order.order(:status).all
    @total = (@orders.map {|o| o.calculate_price; }).sum
    @orders.each do |o|
      update_order(o) 
    end
  end

  def show
    @order = Order.find(params[:id])
    update_order(@order)
    @order_details = @order.get_details
  end

  def new
    @order = Order.all
  end

  def create
    count = Order.count
    t = params[:time].to_datetime
    @order = Order.create(order_date:t, 
      status: params[:status], 
      customer_id: params[:cid], 
      total_price:0
    )
    return render_invalid_request if count + 1 != Order.count
    
    redirect_to order_index_path
  end

  # def edit
  #   @order = Order.find(params[:order_id])
  # end
  
  # def update
  #   @order = Order.find(params[:order_id])
  #   @order.update(order_params)
    
  #   redirect_to order_index_path
  # end

  def delete
    @order = Order.find(params[:order_id])
    @order.delete_details
    @order.destroy
    redirect_to order_index_path
  end

  private
  # def order_params
  #   params.require(:order).permit(:order_date, :status, :customer_id, :total_price)
  # end

  def update_order(order)
    order.update(total_price: order.calculate_price)
    if (order.order_date.strftime("%H").to_i >= 17 and order.status != 1)
      order.update(status: 0)
    end
  end
end
