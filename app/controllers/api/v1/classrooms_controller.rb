class Api::V1::ClassroomsController < ApiController
  def index
    @classrooms = Classroom.all

    render "/api/v1/classrooms/index.json"
  end
end