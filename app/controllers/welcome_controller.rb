class WelcomeController < ApplicationController
helper_method :sort_column, :sort_direction

  def index
  	if params[:league_id]
  	@leagues = League.all
  	@seasons = Season.where(:league_id => params[:league_id]).all.sort_by { |t| -t.name.to_i }
  	@players = Player.where(:league_id => params[:league_id]).select(:id, :golas, :assists, :league_id, :season_id, :playername_id, '"players"."golas" * 2 + "players"."assists" AS "points"').all.order('points DESC')
    @playersall = Player.all
  	else
  	@leagues = League.all
  	@seasons = Season.all.sort_by { |t| -t.name.to_i }
  	@players = Player.select(:id, :golas, :assists, :league_id, :season_id, :playername_id, '"players"."golas" * 2 + "players"."assists" AS "points"').all.order('points DESC')
    @playersall = Player.all
  	end
  	
  end

end
