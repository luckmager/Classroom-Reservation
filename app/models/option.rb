class Option < ApplicationRecord
  has_and_belongs_to_many :classrooms

  def name_with_initial
    "#{name}"
  end
end
