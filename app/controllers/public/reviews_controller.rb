class Public::ReviewsController < ApplicationController
  
  def new
  end

  def index
  end

  def show
  end
  
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
  end
  
  private

  def reiew_params
    params.require(:review).permit(:comment, :star)
  end
end
