class Device < ApplicationRecord
	belongs_to :classroom

	# Must have fields
	validates :name, presence: true
end
