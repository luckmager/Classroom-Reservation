class Qr::ClassroomsController < QrController

  # GET classrooms/index
  def show
    @classroom = Classroom.find(params[:id])
  end

end