json.array!(@comments) do |comment|
  json.extract! comment, :id, :username, :content, :likes
  json.url comment_url(comment, format: :json)
end
