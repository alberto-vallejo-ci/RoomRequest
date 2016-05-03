json.array!(@asistants) do |asistant|
  json.extract! asistant, :id, :code, :name, :carer, :codeEvent
  json.url asistant_url(asistant, format: :json)
end
