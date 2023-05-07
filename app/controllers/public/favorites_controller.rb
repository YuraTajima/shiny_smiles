class Public::FavoritesController < ApplicationController
  
  def create
    submission = Submission.find(params[:submission_id])
    favorite = current_customer.favorites.new(submission_id: submission.id)
    favorite.save
    redirect_to show_submission_path(submission)
  end

  def destroy
    submission = Submission.find(params[submission_id])
    favorite = current_customer.favorites.find_by(submission_id: submission.id)
    favorite.destroy
    redirect_to show_submission_path(submission)
  end

end
