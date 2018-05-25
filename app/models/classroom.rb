class Classroom < ApplicationRecord
	belongs_to :building
	has_one :device
	has_many :reservations
	has_and_belongs_to_many :options
end
