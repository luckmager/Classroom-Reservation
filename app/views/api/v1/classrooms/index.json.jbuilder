json.classrooms @classrooms do |classroom|
  json.(classroom, :id, :name)
  json.building(classroom.building, :id, :name)
  json.temperature classroom.try(:device).try(:temperature)
  json.options classroom.options do |option|
    json.(option, :id, :name)
  end
end