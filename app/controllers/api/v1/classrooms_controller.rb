class Api::V1::ClassroomsController < ApiController

  # GET /api/v1/classrooms
  def index
    @classrooms = Classroom.where(building_id: params[:building_id])

    render "/api/v1/classrooms/index.json"
  end

  def show
    @classroom = Classroom.where(id: params[:id])
  end
end