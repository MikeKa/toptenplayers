class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    reset_session
    if params[:league_id] and params[:season_id]
    @players = Player.where(:league_id => params[:league_id], :season_id => params[:season_id])
    @currentleague = League.where(:id => params[:league_id]).first
    @currentseason = Season.where(:id => params[:season_id]).first
    else
    redirect_to leagues_path
    #@players = Player.all
    end
    session[:leagueid_callback] ||= params[:league_id]
    session[:seasonid_callback] ||= params[:season_id]

  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new(league_id: params[:league_id], season_id: params[:season_id], :playername_id => params[:playername_id])
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url(league_id: session[:leagueid_callback], season_id: session[:seasonid_callback]), notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:golas, :assists, :league_id, :season_id, :playername_id)
    end
end
