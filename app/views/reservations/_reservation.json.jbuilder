json.extract! reservation, :id, :date, :title, :description, :from, :to, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
