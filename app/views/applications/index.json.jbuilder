json.array!(@requests) do |request|
  json.extract! request, :id, :dateRequest, :dateEventI, :dateEventF, :timeEvent, :eventCode, :nameRequesting, :phoneNum, :place
  json.url request_url(request, format: :json)
end
