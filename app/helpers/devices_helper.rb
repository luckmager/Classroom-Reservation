module DevicesHelper
	def classrooms_for_select
	  Classroom.all.collect { |c| [c.name, c.id] }
	end
end
