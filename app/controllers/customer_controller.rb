class CustomerController < ApplicationController
  protect_from_forgery
  
  def index
    @customers = Customer.all
  end

 def new
    @customer = Customer.new
  end

  def create
    Customer.reset_pk_sequence
    Customer.create(customer_params)

    redirect_to customer_index_path
  end

  def edit
    @customer = Customer.find(params[:customer_id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    
    redirect_to customer_index_path
  end

  def delete
    customer = Customer.find(params[:customer_id])
    customer.delete_orders
    customer.destroy
    
    redirect_to customer_index_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email)
  end
end
