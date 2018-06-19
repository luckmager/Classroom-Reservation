class Api::V1::BuildingsController < ApiController

  # GET /api/v1/buildings
  def index
    @buildings = Building.all

    render "/api/v1/buildings/index.json"
  end

  def show

  end
end