class Api::V1::BuildingsController < ApplicationController

  def index
    @buildings = Building.all

    render "/api/v1/buildings/index.json"
  end
end