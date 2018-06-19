class Qr::BuildingsController < QrController

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

end