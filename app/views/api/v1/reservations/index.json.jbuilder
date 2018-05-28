json.reservations @reservations do |reservation|
  json.(reservation, :id, :user_id, :classroom_id, :date, :title, :description, :from, :to)
end