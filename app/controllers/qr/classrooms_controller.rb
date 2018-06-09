class Qr::ClassroomsController < ApplicationController

  def index
    @classrooms = Building.classrooms.find(params[:building_id])
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

end