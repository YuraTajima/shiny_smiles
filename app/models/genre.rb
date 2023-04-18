class Genre < ApplicationRecord
    has_many :submissions, dependent: :destroy
end
