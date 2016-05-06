json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :capacity, :integer
  json.url room_url(room, format: :json)
end
