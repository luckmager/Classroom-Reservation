json.array! [1] do
    json.classrooms @building.classrooms do |classroom|
    json.(classroom, :id, :name)
    json.temperature classroom.try(:device).try(:temperature)
    json.options classroom.options do |option|
      json.(option, :id, :name)
    end
  end
end