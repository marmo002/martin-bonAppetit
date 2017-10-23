class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create

  end

  private

  def reservation_params
    # comment
  end
end
