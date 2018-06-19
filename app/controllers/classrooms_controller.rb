class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/index
  def show
	  @reservation = Reservation.new
    @reservations = Reservation.where(classroom_id: params[:id])
  end

  private
    # Callbacks
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end
end
