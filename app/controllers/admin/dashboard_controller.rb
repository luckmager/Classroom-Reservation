class Admin::DashboardController < AdminController

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all
  end

end
