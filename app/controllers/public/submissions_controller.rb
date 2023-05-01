class Public::SubmissionsController < ApplicationController
  
  def new
    @submission = Submission.new
  end

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submissio.find(params[:id])
  end

  def edit
    @submission = Submissio.find(params[:id])
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    @submission.save
    redirect_to index_submission_path
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      redirect_to show_submission_path(@submission.id)
    else
      render :show
    end
  end
  
   private

  def submission_params
    params.require(:submission).permit(:name, :image, :genre_id, :price, :introduction)
  end
  
end
