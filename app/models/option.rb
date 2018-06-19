class Option < ApplicationRecord
  has_and_belongs_to_many :classrooms

  # Return name of option
  def name_with_initial
    "#{name}"
  end
end
