class Api::V1::ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all

    render "/api/v1/classrooms/index.json"
  end
end