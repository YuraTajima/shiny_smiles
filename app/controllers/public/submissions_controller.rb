class Public::SubmissionsController < ApplicationController
  
  def new
    @submission = Submission.new
  end

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @reviews = @submission.reviews
    @review = Review.new
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.customer_id = current_customer.id
    @submission.save
    redirect_to index_submission_path
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      redirect_to show_submission_path(@submission.id)
    else
      render :edit
    end
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to index_submission_path
  end
  
  private

  def submission_params
    params.require(:submission).permit(:name, :image, :genre_id, :price, :introduction)
  end
  
end
