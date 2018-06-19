json.reservations @reservations do |reservation|
  json.(reservation, :id, :classroom_id, :date, :title, :description, :from_block, :to_block)
  json.classroom_name reservation.classroom.name
end