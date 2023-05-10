class Public::ReviewsController < ApplicationController
  
  def create
    submission = Submission.find(params[:submission_id])
    review = current_customer.reviews.new(review_params)
    review.submission_id = submission.id
    review.save
    redirect_to public_submission_path(submission)
  end
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_to public_submission_path(params[:submission_id])
  end
  
  private

  def review_params
    params.require(:review).permit(:comment, :star)
  end
end
