class Public::SubmissionsController < ApplicationController
  
  def new
    @submission = Submission.new
  end

  def index
    @submissions = Submission.all
  end

  def show
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)
    # @submission.user_id = current_user.id
    if @submission.save
      redirect_to index_submission_path
    else
      @submissions = Submission.all
      render :new
    end
  end

  def update
  end
  
   private

  def submission_params
    params.require(:submission).permit(:name, :image, :genre_id, :price, :introduction)
  end
  
end
