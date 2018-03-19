module ClassroomsHelper
	def buildings_for_select
	  Building.all.collect { |b| [b.name, b.id] }
	end
end
