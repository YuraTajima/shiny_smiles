class Admin::SubmissionsController < ApplicationController
  def index
    @submissions = Submission.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def edit
    @submission = Submission.find(params[:id])
  end
  
  def update
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    redirect_to admin_submission_path(@submission.id)
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to admin_submissions_path
  end
  
  def submission_params
    params.require(:submission).permit(:name, :image, :genre_id, :price, :introduction)
  end
end
