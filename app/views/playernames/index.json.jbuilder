json.array!(@playernames) do |playername|
  json.extract! playername, :id, :name, :team, :amplua, :photolink
  json.url playername_url(playername, format: :json)
end
