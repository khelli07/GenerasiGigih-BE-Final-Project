class OrderController < ApplicationController
  protect_from_forgery
  
  def index
    @orders = Order.all
    @emails = []
    @orders.each do |ord|
      @emails.append(Customer.find(ord.customer_id).email) 
    end 
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.get_details
    @foods = []
    @order_details.each do |od|
      @foods.append(Food.find(od.food_id).name) 
    end 
  end

  def new
    @customers = Customer.all
    @order = Order.new
  end

  def create
    Order.reset_pk_sequence
    OrderDetail.reset_pk_sequence
    
    @order = Order.create(order_params)
    
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
  def order_params
    params.require(:order).permit(:order_date, :status, :customer_email, :total_price)
  end
end
