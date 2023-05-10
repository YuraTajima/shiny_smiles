class Public::SubmissionsController < ApplicationController
  
  def new
    @submission = Submission.new
  end

  def index
    @submissions = Submission.order(created_at: :desc).page(params[:page]).per(5)
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
    render "index"
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
    @submissions = Submission.order(created_at: :desc)
  end
  
#歯磨き粉
  def genre2
    @submissions = Submission.all
  end
  
#補助的清掃用具
  def genre3
    @submissions = Submission.all
  end
  
#洗口液
  def genre4
    @submissions = Submission.all
  end
  
#ホワイトニング用品
  def genre5
    @submissions = Submission.all
  end
  
#口臭ケア用品
  def genre6
    @submissions = Submission.all
  end
  
  private

  def submission_params
    params.require(:submission).permit(:name, :image, :genre_id, :price, :introduction)
  end
  
end

