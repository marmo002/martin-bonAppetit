class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, :time, :num_seats, presence: true
end
