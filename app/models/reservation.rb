class Reservation < ApplicationRecord
belongs_to :user
belongs_to :classroom
validates_presence_of :from, :to
validate :to_is_after_from
validate :is_booked

	def to_is_after_from
		return if to.blank? || from.blank?

		if to < from
			errors.add(:from, "From block can't be after To block") 
		end 
	end
	
	def is_booked
		@reservations = Reservation.where(date: date)
		@reservations.each do |reservation|
			if (from..to).overlaps?(reservation.from..reservation.to)
				errors.add(:from, "Already booked") 
			end
		end
	end
	
end
