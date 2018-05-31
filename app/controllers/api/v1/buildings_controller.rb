class Api::V1::BuildingsController < ApiController
  before_action :authenticate_user!

  def index
    @buildings = Building.all

    render "/api/v1/buildings/index.json"
  end
end