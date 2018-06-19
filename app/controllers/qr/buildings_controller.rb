class Qr::BuildingsController < QrController

  # GET buildings
  def index
    @buildings = Building.all
  end

  # GET buildings/index
  def show
    @building = Building.find(params[:id])
  end

end