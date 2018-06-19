class Api::V1::ReservationsController < ApiController
  before_action :authenticate_user!

  # GET /api/v1/reservations
  def index
    # Get the reservations of the user
    @reservations = Reservation.where(user_id: current_user.id)

    render "/api/v1/reservations/index.json"
  end
end