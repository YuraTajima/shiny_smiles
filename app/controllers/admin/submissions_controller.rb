class Admin::SubmissionsController < ApplicationController
  def index
    @submissions = Submission.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end
end
