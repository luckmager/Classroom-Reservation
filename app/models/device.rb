class Device < ApplicationRecord
	belongs_to :classroom
	validates :name, presence: true
end
