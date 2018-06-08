module DevicesHelper
	def classrooms_for_select
	  Classroom.all.collect { |classroom| [classroom.name, classroom.id] }
	end
end
