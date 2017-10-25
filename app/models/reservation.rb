class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, :time, :num_seats, presence: true
  validate :has_enough_seats

  def send_confirmation_sms
    # set up client for Twilio API
    client = Twilio::REST::Client.new(
      ENV.fetch('TWILIO_ID'),
      ENV.fetch('TWILIO_TOKEN')
    )

    client.api.account.messages.create(
      from: ENV.fetch('PHONE_NUMBER'),
      to: "+1#{self.user.phone}",
      body: "You have a reservation at #{self.restaurant.name} on #{self.date} at #{self.time}"
    )
  end

  def has_enough_seats
    return if self.num_seats.blank? || self.date.blank?

    if self.num_seats > self.restaurant.remaining_seats(self.date)
      errors.add(:num_seats, "Sorry, there are only #{self.restaurant.remaining_seats(self.date)} seats remaining")
    end
  end
end
