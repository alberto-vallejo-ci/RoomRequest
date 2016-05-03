json.array!(@events) do |event|
  json.extract! event, :id, :codeEvent, :eventType, :ponenteName, :personInCharge, :phoneNum, :forniture
  json.url event_url(event, format: :json)
end
