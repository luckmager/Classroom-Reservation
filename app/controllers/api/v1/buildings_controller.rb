class Api::V1::BuildingsController < ApiController
  before_action :authenticate_user!

  # GET /api/v1/buildings
  def index
    @buildings = Building.all

    render "/api/v1/buildings/index.json"
  end
end