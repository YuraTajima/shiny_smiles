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
    redirect_to submission_path(@submission.id)
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path
  end
end
