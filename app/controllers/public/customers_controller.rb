class Public::CustomersController < ApplicationController
  
  def index
    @customer = current_customer
    @submissions = @customer.submissions
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_session)
      redirect_to show_customer_path(@customer.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
