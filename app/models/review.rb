class Review < ApplicationRecord
    belongs_to :customer
    belongs_to :submission
    validates :comment, presence: true
end
