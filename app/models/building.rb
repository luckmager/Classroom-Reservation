class Building < ApplicationRecord
	has_many :classrooms, dependent: :destroy
end
