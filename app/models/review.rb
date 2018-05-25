class Review < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  validates :content, presence: true
  validates :rating, inclusion: {in: [1,2,3,4,5]}
end
