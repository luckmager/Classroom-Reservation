module DevicesHelper
	def classrooms_for_select
	  Classroom.where(building_id: params[:id]).order(:name).collect { |classroom| [classroom.name, classroom.id] }
	end
end
