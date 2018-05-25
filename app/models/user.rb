class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :postcode, presence: true
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?
  has_many :dogs
  has_many :bookings

end
