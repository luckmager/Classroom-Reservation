class Classroom < ApplicationRecord
	belongs_to :building
	has_one :device, dependent: :destroy
	has_many :reservations, dependent: :destroy
	has_and_belongs_to_many :options, dependent: :destroy

	# Must have fields
	validates :name, :max_persons, presence: true
end
