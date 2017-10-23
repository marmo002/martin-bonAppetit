class User < ApplicationRecord

  has_secure_password

  has_many :reservations
  has_one :restaurant

  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true

  def is_admin?
    self.restaurant.present?
  end
end
