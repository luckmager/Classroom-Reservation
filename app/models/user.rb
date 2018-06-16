class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:student, :teacher, :admin, :qr]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reservations
  include DeviseTokenAuth::Concerns::User
  validates :role, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }
end