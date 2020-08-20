class Studio < ApplicationRecord
  belongs_to :user
  validates :price, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :title, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_title_description_and_address,
  against: [:title, :address, :description],
  using: {
  tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  has_one_attached :photo
end
