class Api::V1::ReservationsController < ApiController
  def index
    @reservations = Reservation.all

    render "/api/v1/reservations/index.json"
  end
end