json.array!(@videos) do |video|
  json.extract! video, :id, :name, :description, :video_url, :entry_id
  json.url video_url(video, format: :json)
end
