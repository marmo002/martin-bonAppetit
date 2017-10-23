class User < ApplicationRecord
  has_many :reservations
  has_one :restaurant
  
end
