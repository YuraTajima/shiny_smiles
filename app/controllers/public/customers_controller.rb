class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @submissions = @customer.submissions
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to show_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :email)
  end

end
