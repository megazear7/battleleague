json.array!(@alliances) do |alliance|
  json.extract! alliance, :id
  json.url alliance_url(alliance, format: :json)
end
