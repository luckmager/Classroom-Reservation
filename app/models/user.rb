class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:student, :teacher, :admin, :qr]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reservations
  include DeviseTokenAuth::Concerns::User
  validates_inclusion_of :role, :in => 0..3
end