class Admin::ReviewsController < ApplicationController
  def create
    submission = Submission.find(params[:submission_id])
    review.submission_id = submission.id
    review.save
    redirect_to admin_submission_path(submission)
  end
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_to admin_submission_path(params[:submission_id])
  end
  
  private

  def review_params
    params.require(:review).permit(:comment, :star)
  end
end
