json.array!(@events) do |event|
  json.extract! event, :id, :name, :content, :day_of
  json.url event_url(event, format: :json)
end
