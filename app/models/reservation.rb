class Reservation < ApplicationRecord
belongs_to :user
belongs_to :classroom

validates_presence_of :from_block, :to_block, :date, :title, :description
validate :to_is_after_from
validate :is_booked
validate :date_is_in_range
validates_numericality_of :from_block, less_than_or_equal_to: 15, greater_than: 0
validates_numericality_of :to_block, less_than_or_equal_to: 15, greater_than: 0

	def to_is_after_from
		return if to_block.blank? || from_block.blank?

		if to_block < from_block
			errors.add(:from_block, "From block can't be after To block")
		end 
	end
	
	def is_booked
		@reservations = Reservation.where(date: date)
		@reservations.each do |reservation|
			if (from_block..to_block).overlaps?(reservation.from_block..reservation.to_block) && reservation.id != id
				errors.add(:from, "Already booked") 
			end
		end
	end
	
	def date_is_in_range
		maxDate = Time.now + (2*7*24*60*60)
		if date.to_date > maxDate
			errors.add(:date, "The date is beyond the maximum date") 
		end
		if date.to_date < Time.now.prev_day
			errors.add(:date, "Can not book in the past") 
		end
	end
	
end
