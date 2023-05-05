class Public::ReviewsController < ApplicationController
  
  def new
  end

  def index
  end

  def show
  end
  
  def create
    @submission = Submission.find(params[:submission_id])
    @review = current_customer.reviews.new(review_params)
    @review.submission_id = submission.id
    @review.save
    redirect_to show_submission_path
  end
  
  private

  def review_params
    params.require(:review).permit(:comment, :star)
  end
end
