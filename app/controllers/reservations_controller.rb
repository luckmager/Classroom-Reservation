class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  def index
    if current_user
      @reservations = Reservation.where("user_id = ? AND date >= ?", current_user.id, Time.now.strftime("%Y-%m-%d"))
                                 .order(:date, :from_block)
    else
      @reservations = Reservation.all
    end
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/index/edit
  def edit
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
	  @reservation.user_id = current_user.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to building_classroom_path(@reservation.classroom.building, @reservation.classroom), notice: 'Reservation was successfully created.' }
        ReservationMailer.with(reservation: @reservation).reservation_booked_mail.deliver_now
      else
        format.html { redirect_to building_classroom_path(@reservation.classroom.building, @reservation.classroom), notice: @reservation.errors }
      end
    end
  end

  # PUT /reservations/index
  def update
    if @reservation.user_id == current_user.id || current_user.role == 2
      respond_to do |format|
        if @reservation.update(reservation_params)
          format.html { redirect_to reservations_path, notice: 'Reservation was successfully updated.' }
          ReservationMailer.with(reservation: @reservation).reservation_updated_mail.deliver_now
        else
          format.html { render :edit }
        end
      end
    else
      format.html { redirect_to reservations_path, notice: 'This is not your reservation.' }
    end
  end

  # DELETE /reservations/index
  def destroy
    if @reservation.user_id == current_user.id || current_user.role == 2
      @reservation.destroy
      respond_to do |format|
        format.html { redirect_to reservations_url, notice: 'Reservation was successfully deleted.' }
        ReservationMailer.with(reservation: @reservation).reservation_canceled_mail.deliver_now
      end
    else
      format.html { redirect_to reservations_path, notice: 'This is not your reservation.' }
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
