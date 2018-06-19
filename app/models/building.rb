class Building < ApplicationRecord
	has_many :classrooms, dependent: :destroy

	# Must have fields
	validates :name, presence: true
end
