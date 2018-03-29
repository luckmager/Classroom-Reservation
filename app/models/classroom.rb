class Classroom < ApplicationRecord
	belongs_to :building
	has_one :device
end
