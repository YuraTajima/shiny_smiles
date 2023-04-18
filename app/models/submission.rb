class Submission < ApplicationRecord
    has_one_attached :image
    belongs_to :customer
    belongs_to :genre
    
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
