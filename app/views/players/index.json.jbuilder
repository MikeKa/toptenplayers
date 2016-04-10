json.array!(@players) do |player|
  json.extract! player, :id, :name, :golas, :assists, :league_id, :season_id
  json.url player_url(player, format: :json)
end
