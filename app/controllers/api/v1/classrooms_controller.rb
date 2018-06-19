class Api::V1::ClassroomsController < ApiController
  before_action :authenticate_user!

  # GET /api/v1/classrooms
  def index
    @classrooms = Classroom.where(building_id: params[:building_id])

    render "/api/v1/classrooms/index.json"
  end
end