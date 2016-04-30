json.array!(@trucks) do |truck|
  json.extract! truck, :id, :name, :web_url, :phone_number, :claimed
  json.url truck_url(truck, format: :json)
end
