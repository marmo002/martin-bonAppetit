class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :address, :city, :price_range, :total_seats, :open_hour, :close_hour, presence: true
end
