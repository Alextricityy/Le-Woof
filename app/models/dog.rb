class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  # validation
  mount_uploader :photo, PhotoUploader
  validates :name, presence:true
  validates :description, presence:true
  validates :photo, presence:true
  validates :size, presence:true, inclusion: { in: %w(Small Medium Large)}
  validates :gender, presence:true, inclusion: { in: %w(Male Female)}
  validates :price, presence:true
end
