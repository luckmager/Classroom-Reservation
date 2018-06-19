class Qr::ClassroomsController < QrController

  def show
    @classroom = Classroom.find(params[:id])
  end

end