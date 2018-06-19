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

  # GET /reservations/index
  def show
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
	  #@reservation.user_id = current_user.id
    @reservation.user_id = 2

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to classroom_path(@reservation.classroom), notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
        ReservationMailer.with(reservation: @reservation).reservation_booked_mail.deliver_now
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/index
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
        ReservationMailer.with(reservation: @reservation).reservation_updated_mail.deliver_now
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/index
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
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
