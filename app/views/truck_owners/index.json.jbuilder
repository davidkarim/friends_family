json.array!(@truck_owners) do |truck_owner|
  json.extract! truck_owner, :id, :name, :email
  json.url truck_owner_url(truck_owner, format: :json)
end
