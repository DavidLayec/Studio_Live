class Studio < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :title, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
