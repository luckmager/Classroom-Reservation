class Api::V1::ReservationsController < ApiController
  before_action :set_reservation, only: [:update, :destroy]

  # GET /api/v1/reservations
  def index
    # Get the reservations of the user
    if current_user
      @reservations = Reservation.where("user_id = ? AND date >= ?", current_user.id, Time.now.strftime("%Y-%m-%d"))
                                 .order(:date, :from_block)
    end

    render "/api/v1/reservations/index.json"
  end

  # POST /api/v1/reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      render json: {
          success: true
      }, status: 200
      ReservationMailer.with(reservation: @reservation).reservation_booked_mail.deliver_now
    else
      render json: {
          success: false,
          errors: @reservation.errors
      }, status: :unprocessable_entity
    end
  end

  # PUT /reservations/index
  def update
    if @reservation.user_id == current_user.id || current_user.role == 2
      if @reservation.update(reservation_params)
        render json: {
            success: true
        }, status: 200
        ReservationMailer.with(reservation: @reservation).reservation_updated_mail.deliver_now
      else
        render json: {
            success: false,
            errors: @reservation.errors
        }, status: :unprocessable_entity
      end
    else
      render json: {
          success: false,
          errors: ["This is not your reservation"]
      }, status: 401
    end
  end

  # DELETE /reservations/index
  def destroy
    if @reservation.user_id == current_user.id || current_user.role == 2
      @reservation.destroy
      render json: {
          success: true
      }, status: 200
      ReservationMailer.with(reservation: @reservation).reservation_canceled_mail.deliver_now
    else
      render json: {
          success: false,
          errors: ["This is not your reservation"]
      }, status: 401
    end
  end

  private
  # Callbacks
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Trusted parameters
  def reservation_params
    params.require(:reservation).permit(:classroom_id, :date, :title, :description, :from_block, :to_block)
  end
end