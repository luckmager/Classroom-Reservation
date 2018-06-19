module QrHelper
  def get_classroom
    if params[:id] && params[:building_id]
      classroom = Classroom.find(params[:id])
      return classroom.name
    else
      return 'HR Classrooms - QR'
    end
  end
end
