json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :name, :year
  json.url vehicle_url(vehicle, format: :json)
end
