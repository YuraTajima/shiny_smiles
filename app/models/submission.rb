class Submission < ApplicationRecord
    belongs_to :customer
    belongs_to :genre
    
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorited_customers, through: :favorites, source: :customer
    
    has_one_attached :image
    
    def get_image(width, height)
        unless image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image.variant(resize_to_limit: [width, height]).processed
    end
    
    def favorited_by?(customer)
      favorites.exists?(customer_id: customer_id)
    end
    
    def self.search(keyword)
        where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
    end
end
