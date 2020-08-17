class Studio < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :country, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
