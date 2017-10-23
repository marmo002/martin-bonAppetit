class User < ApplicationRecord
  has_many :reservations
  has_one :restaurant

  validates :name, :email, :phone, presence: true


  def is_admin?
    self.restaurant.present?
  end
end
