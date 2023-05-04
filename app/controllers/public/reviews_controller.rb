class Public::ReviewsController < ApplicationController
  
  def new
  end

  def index
  end

  def show
  end
  
  private

  def reiew_params
    params.require(:review).permit(:comment, :star)
  end
end
