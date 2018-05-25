class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  # validation
  mount_uploader :photo, PhotoUploader
  validates :name, presence:true
  validates :description, presence:true
  # validates :photo, presence:true
  validates :size, presence:true, inclusion: { in: %w(Small Medium Large)}
  validates :gender, presence:true, inclusion: { in: %w(Male Female)}
  validates :price, presence:true

   include PgSearch
   # pg_search_scope :search, :against => :name
   pg_search_scope :search_everything,
    against: [ :name, :breed, :size ],
    using: {
      tsearch: { prefix: true }
    }
end
