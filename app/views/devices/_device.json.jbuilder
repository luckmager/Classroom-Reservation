json.extract! device, :id, :name, :auth, :temperature, :humidity, :updated_at
json.url device_url(device, format: :json)
