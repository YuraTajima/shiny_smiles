class Public::SubmissionsController < ApplicationController
  
  def new
    @submission = Submission.new
  end

  def index
    @submissions = Submission.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def category
    @submissions = Submission.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @submission = Submission.find(params[:id])
    @review = Review.new
  end
  
  def top
    submissions = Submission.includes(:favorited_customers).sort {|a,b| b.favorited_customers.size <=> a.favorited_customers.size}
    @submissions = Kaminari.paginate_array(submissions).page(params[:page]).per(3)
  end

  def edit
    @submission = Submission.find(params[:id])
  end
  
  def search
    @submissions = Submission.search(params[:keyword])
    @keyword = params[:keyword]
    render "category"
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.customer_id = current_customer.id
    if @submission.save
      redirect_to index_submission_path
    else
      render :new
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      redirect_to public_submission_path(@submission.id)
    else
      render :edit
    end
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to index_submission_path
  end
  
  
#歯ブラシ
  def genre1
    @submissions = Submission.where(genre_id:1)
  end
  
#歯磨き粉
  def genre2
    @submissions = Submission.where(genre_id:2)
  end
  
#補助的清掃用具
  def genre3
    @submissions = Submission.where(genre_id:3)
  end
  
#洗口液
  def genre4
    @submissions = Submission.where(genre_id:4)
  end
  
#ホワイトニング用品
  def genre5
    @submissions = Submission.where(genre_id:5)
  end
  
#口臭ケア用品
  def genre6
    @submissions = Submission.where(genre_id:6)
  end
  
  private

  def submission_params
    params.require(:submission).permit(:name, :image, :genre_id, :price, :introduction)
  end
  
end

