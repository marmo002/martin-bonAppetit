class User < ApplicationRecord

  has_secure_password

  has_many :reservations
  has_one :restaurant

  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true
  validates :phone, format:{ with: /\A\d{10}\z/, message: 'must be in format 1234567878' } 

  def is_admin?
    self.restaurant.present?
  end
end
