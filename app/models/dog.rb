class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  # validation
  validates :name, presence:true
  validates :description, presence:true
  validates :image_url, presence:true
  validates :size, presence:true, inclusion: { in: %w(small medium large)}
  validates :gender, presence:true, inclusion: { in: %w(male female)}
  validates :price, presence:true
end
