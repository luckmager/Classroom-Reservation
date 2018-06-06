class Admin::DashboardController < ApplicationController

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all
  end

end
