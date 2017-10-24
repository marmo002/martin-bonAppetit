class Restaurant < ApplicationRecord

  PRICE_RANGES = {
    '15 - 30' => '$15 to $30',
    '30 - 60' => '$30 to $60',
    '60 - 90' => '$60 to $90'
  }

  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :address, :description, :city, :price_range, :total_seats, :open_hour, :close_hour, presence: true

  # instance methods
  def todays_reservations
    self.reservations.where(date: Date.today).where(status: 'confirmed').sum(:num_seats)
  end

  def remaining_seats
    self.total_seats - self.todays_reservations
  end
end
