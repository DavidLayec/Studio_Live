class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  validates :time_in, presence: true
  validates :time_out, presence: true
  validates :booked, presence: true
  validates :value, presence: true
end
