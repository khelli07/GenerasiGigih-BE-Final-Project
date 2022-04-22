class OrderController < ApplicationController
  protect_from_forgery
  
  def index
    @orders = query(params[:email], params[:order_date])
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
    @customers = Customer.all
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

  def delete
    @order = Order.find(params[:order_id])
    @order.delete_details
    @order.destroy
    redirect_to order_index_path
  end

  private
  def update_order(order)
    order.update(total_price: order.calculate_price)
    if (order.order_date.strftime("%H").to_i >= 17 and order.status != 1)
      order.update(status: 0)
    end
  end

  def query(param_email, param_date)
    if ((param_email == nil and param_date == nil) or (param_email == "" and param_date == ""))
      return Order.order(:status).all
    end
    
    email = "%" + param_email + "%"
    customer = Customer.select(:id).where("email like ?", email)
    
    starts = ""; ends = ""
    if (param_date != nil and param_date != "")
      param_date = Date.parse(param_date)
      starts = param_date.beginning_of_day
      ends = param_date.end_of_day
    end
    
    if (customer.length() == 1)
      id = "%" + customer[0].id.to_s + "%"
      order = (Order.order(:status)
        .where(
          "customer_id like ? or 
          created_at BETWEEN ? AND ?", 
          id, starts, ends))
    else
      order = (Order.order(:status).where("created_at BETWEEN ? AND ?",   
         starts, ends))
    end
    
    return order
  end
  
end
