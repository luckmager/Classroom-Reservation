class Api::V1::ReservationsController < ApiController
  def index
    @reservations = Reservation.where(user_id: current_user.id)

    render "/api/v1/reservations/index.json"
  end
end