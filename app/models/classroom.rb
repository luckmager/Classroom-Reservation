class Classroom < ApplicationRecord
	belongs_to :building
	has_one :device
	has_many :reservations
	has_and_belongs_to_many :options

	validates :name, :max_persons, presence: true
end
