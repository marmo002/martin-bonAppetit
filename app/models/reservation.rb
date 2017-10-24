class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, :time, :num_seats, presence: true
  validate :has_enough_seats

  def has_enough_seats
    if self.num_seats > self.restaurant.remaining_seats
      errors.add(:num_seats, "Sorry, there are only #{self.restaurant.remaining_seats} remaining")
    end
  end
end
