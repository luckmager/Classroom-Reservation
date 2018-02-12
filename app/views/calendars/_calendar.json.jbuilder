json.extract! calendar, :id, :classroom, :startTime, :endTime, :reservation, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
