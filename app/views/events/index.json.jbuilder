json.array!(@events) do |event|
  json.extract! event, :id, :name, :rules, :description
  json.url event_url(event, format: :json)
end
