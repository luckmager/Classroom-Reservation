json.extract! device, :id, :name, :auth, :temperature, :created_at, :updated_at
json.url device_url(device, format: :json)
