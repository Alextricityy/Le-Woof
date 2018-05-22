class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  # validation
  mount_uploader :photo, PhotoUploader
  validates :name, presence:true
  validates :description, presence:true
  validates :photo, presence:true
  validates :size, presence:true, inclusion: { in: %w(small medium large)}
  validates :gender, presence:true, inclusion: { in: %w(male female)}
  validates :price, presence:true
end
