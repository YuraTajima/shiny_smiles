class Public::CustomersController < ApplicationController
  

  def show
    @customer = current_customer
    @submissions = @customer.submissions
  end
  
  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:submission_id)
    @favorite_submissions = Submission.find(favorites)
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
  
  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :email)
  end

end
